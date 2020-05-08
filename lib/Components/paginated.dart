import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/transitionQuiz.dart';
// import 'package:vocab/Module/words.dart';
import 'package:vocab/Pages/home4.dart';
import 'tabledata.dart' as tab;
import 'package:vocab/Components/datasource.dart' as tabsource;



class Paginated extends StatefulWidget {
  Paginated({
    Key key,
    this.header,
    this.actions,
    @required this.dataquiz,
    @required this.columns,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.dataRowHeight = kMinInteractiveDimension,
    this.headingRowHeight = 56.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 10.0,
    this.initialFirstRowIndex,
    this.onPageChanged,
    this.rowsPerPage = defaultRowsPerPage,
    this.availableRowsPerPage = const <int>[
      defaultRowsPerPage,
      defaultRowsPerPage * 2,
      defaultRowsPerPage * 5,
      defaultRowsPerPage * 10
    ],
    this.onRowsPerPageChanged,
    this.dragStartBehavior = DragStartBehavior.start,
    @required this.source,
  })  : 
  // assert(header != null),
        assert(columns != null),
        assert(dragStartBehavior != null),
        assert(columns.isNotEmpty),
        assert(sortColumnIndex == null ||
            (sortColumnIndex >= 0 && sortColumnIndex < columns.length)),
        assert(sortAscending != null),
        assert(dataRowHeight != null),
        assert(headingRowHeight != null),
        assert(horizontalMargin != null),
        assert(columnSpacing != null),
        assert(rowsPerPage != null),
        assert(rowsPerPage > 0),
        assert(() {
          if (onRowsPerPageChanged != null)
            assert(availableRowsPerPage != null &&
                availableRowsPerPage.contains(rowsPerPage));
          return true;
        }()),
        assert(source != null),
        super(key: key);

  final List<Words2> dataquiz;
  final Widget header;

  // final int firstRowIndex;

  final List<Widget> actions;

  final List<tab.DataColumn> columns;

  final int sortColumnIndex;

  final bool sortAscending;

  final ValueSetter<bool> onSelectAll;

  final double dataRowHeight;

  final double headingRowHeight;

  final double horizontalMargin;

  final double columnSpacing;

  final int initialFirstRowIndex;

  final ValueChanged<int> onPageChanged;

  final int rowsPerPage;

  static const int defaultRowsPerPage = 10;

  // static const int defaultFirstIndex = 0;

  final List<int> availableRowsPerPage;

  final ValueChanged<int> onRowsPerPageChanged;

  final tabsource.DataTableSource source;

  final DragStartBehavior dragStartBehavior;

  @override
  PaginatedState createState() => PaginatedState();
}

class PaginatedState extends State<Paginated>  {
  int _firstRowIndex;
  int _rowCount;
  bool _rowCountApproximate;
  int _selectedRowCount;
  final Map<int, tab.DataRow> _rows = <int, tab.DataRow>{};

  @override
  void initState() {
    super.initState();
    setState(() {
      _firstRowIndex = PageStorage.of(context)?.readState(context, identifier: ValueKey(
              '${dts.index }')  ) as int ??
          widget.initialFirstRowIndex ??
          0;
    });

    widget.source.addListener(_handleDataSourceChanged);
    _handleDataSourceChanged();
  }

  @override
  void didUpdateWidget(Paginated oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source != widget.source) {
      oldWidget.source.removeListener(_handleDataSourceChanged);
      widget.source.addListener(_handleDataSourceChanged);
      _handleDataSourceChanged();
    }
  }

  @override
  void dispose() {
    widget.source.removeListener(_handleDataSourceChanged);
    super.dispose();
  }

  void _handleDataSourceChanged() {
    setState(() {
      // _getRows(_firstRowIndex, _rowCount);
      // _firstRowIndex = widget.source.initialFirstRowIndex;
      // _firstRowIndex = widget.source.firstrowindex;
      _rowCount = widget.source.rowCount;
      _rowCountApproximate = widget.source.isRowCountApproximate;
      _selectedRowCount = widget.source.selectedRowCount;
      _rows.clear();
    });
  }

  /// Ensures that the given row is visible.
  void pageTo(int rowIndex) {
    final int oldFirstRowIndex = _firstRowIndex;
    setState(() {
      final int rowsPerPage = widget.rowsPerPage;
      // final int firstRowIndex = widget.firstRowIndex;
      _firstRowIndex = (rowIndex ~/ rowsPerPage) * rowsPerPage;
    });
    if ((widget.onPageChanged != null) && (oldFirstRowIndex != _firstRowIndex))
      widget.onPageChanged(_firstRowIndex);
  }

  tab.DataRow _getBlankRowFor(int index) {
    return tab.DataRow.byIndex(
      index: index,
      cells: widget.columns
          .map<tab.DataCell>((tab.DataColumn column) => tab.DataCell.empty)
          .toList(),
    );
  }

  tab.DataRow _getProgressIndicatorRowFor(int index) {
    bool haveProgressIndicator = false;
    final List<tab.DataCell> cells =
        widget.columns.map<tab.DataCell>((tab.DataColumn column) {
      if (!column.numeric) {
        haveProgressIndicator = true;
        return const tab.DataCell(CircularProgressIndicator());
      }
      return tab.DataCell.empty;
    }).toList();
    if (!haveProgressIndicator) {
      haveProgressIndicator = true;
      cells[0] = const tab.DataCell(CircularProgressIndicator());
    }
    return tab.DataRow.byIndex(
      index: index,
      cells: cells,
    );
  }

  List<tab.DataRow> _getRows(int firstRowIndex, int rowsPerPage) {
    final List<tab.DataRow> result = <tab.DataRow>[];
    final int nextPageFirstRowIndex = firstRowIndex + rowsPerPage;
    bool haveProgressIndicator = false;
    for (int index = firstRowIndex; index < nextPageFirstRowIndex; index += 1) {
      tab.DataRow row;
      if (index < _rowCount || _rowCountApproximate) {
        row = _rows.putIfAbsent(index, () => widget.source.getRow(index));
        if (row == null && !haveProgressIndicator) {
          row ??= _getProgressIndicatorRowFor(index);
          haveProgressIndicator = true;
        }
      }
      row ??= _getBlankRowFor(index);
      result.add(row);
    }
    return result;
  }

  void _handlePrevious() {
    pageTo(math.max(_firstRowIndex - widget.rowsPerPage, 0));
  }

  void _handleNext() {
    pageTo(_firstRowIndex + widget.rowsPerPage);
  }

  final GlobalKey _tableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    // HEADER
    final List<Widget> headerWidgets = <Widget>[];
    double startPadding = 24.0;
    // if (_selectedRowCount == 0) {
    //   headerWidgets.add(Expanded(child: widget.header));
    //   if (widget.header is ButtonBar) {
    //     // We adjust the padding when a button bar is present, because the
    //     // ButtonBar introduces 2 pixels of outside padding, plus 2 pixels
    //     // around each button on each side, and the button itself will have 8
    //     // pixels internally on each side, yet we want the left edge of the
    //     // inside of the button to line up with the 24.0 left inset.
    //     // TODO(ianh): Better magic. See https://github.com/flutter/flutter/issues/4460
    //     startPadding = 12.0;
    //   }
    // } else {
    //   headerWidgets.add(Expanded(
    //     child: Text(localizations.selectedRowCountTitle(_selectedRowCount)),
    //   ));
    // }
    // if (widget.actions != null) {
    //   headerWidgets.addAll(
    //     widget.actions.map<Widget>((Widget action) {
    //       return Padding(
    //         // 8.0 is the default padding of an icon button
    //         padding: const EdgeInsetsDirectional.only(start: 24.0 - 8.0 * 2.0),
    //         child: action,
    //       );
    //     }).toList()
    //   );
    // }

    final TextStyle footerTextStyle =
        TextStyle(fontSize: 19, color: Colors.black);

    if (widget.onRowsPerPageChanged != null) {
      final List<Widget> availableRowsPerPage = widget.availableRowsPerPage
          .where(
              (int value) => value <= _rowCount || value == widget.rowsPerPage)
          .map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('$value  mots'),
        );
      }).toList();
    //Gotta do all over with media query and double check when 1000 / 1000
      headerWidgets.addAll(<Widget>[
        // Container( width: MediaQuery.of(context).size.width*0.01), // to match trailing padding in case we overflow and end up scrolling
        
        Container(
          height: 30,
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.orange,
                  // shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.orange,
                  ),
                  borderRadius:  BorderRadius.all(
                    Radius.circular(10),
                    ),
                    
                ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 50.0), // 40.0 for the text, 24.0 for the icon
            child:  Align(
              alignment: AlignmentDirectional.centerEnd,
              child: DropdownButtonHideUnderline(
                child:  DropdownButton<int>(
                  // hint: Text('mots ', style: TextStyle(color: Colors.black)) ,
                   
                  items: availableRowsPerPage.cast<DropdownMenuItem<int>>(),
                  
                  value: widget.rowsPerPage,
                  
                  onChanged: widget.onRowsPerPageChanged,
                  style: footerTextStyle,
                  iconSize: 24.0,
                ),
              ),
            ),
          ),
        ),
      



        
        Container(width: MediaQuery.of(context).size.width*0.15),
        Container(
          height: 30,
          padding: EdgeInsets.only(left: 5, right: 5),
          alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.orange,
                  // shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.orange,
                  ),
                  borderRadius:  BorderRadius.all(
                    Radius.circular(10),
                    ),
                    
                ),
          
          child: Text(
            localizations.pageRowsInfoTitle(//changed source code here
              _firstRowIndex + 1,
              _firstRowIndex + widget.rowsPerPage,
              _rowCount,
              _rowCountApproximate,
            ),
            style: footerTextStyle,
          ),
        ),
        Container(width: MediaQuery.of(context).size.width*0.05),
      ]);
    }

    final List<Widget> footerWidgets = <Widget>[];

    footerWidgets.addAll(<Widget>[
      IconButton(
        color: Colors.orange,
        icon: const Icon(Icons.chevron_left),
        padding: EdgeInsets.zero,
        tooltip: localizations.previousPageTooltip,
        onPressed: _firstRowIndex <= 0 ? null : _handlePrevious,
      ),
      Container(width: MediaQuery.of(context).size.width*0.08),
      Container(
        height: 40,
        width: 140,
        
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius:  BorderRadius.all(
                    Radius.circular(7),
                    ),
        ),
        child: FlatButton(
            child: Text('Quiz', style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                    builder: (context) => TransitionQuiz(
                        firstWordIndex: _firstRowIndex + 1,
                        lastWordIndex: widget.rowsPerPage + _firstRowIndex,
                        description:
                            'Il y a trois niveau de difficulté (...). Aussi possible de choisir nombre de mots a prendre en compte.')
                    // Navigator.of(context).pushNamed(MaterialPageRoute(builder: (context) => '/Quiz');
                    // MyQuiz()
                    // Navigator.pushNamed(context, '/MyQuiz');
                    ),
              );
            }),
      ),
      // Container(width: 150.0),
      
      Container(width: MediaQuery.of(context).size.width*0.08),
      IconButton(
        color: Colors.orange,
        icon: const Icon(Icons.chevron_right),
        padding: EdgeInsets.zero,
        tooltip: localizations.nextPageTooltip,
        onPressed: (!_rowCountApproximate &&
                (_firstRowIndex + widget.rowsPerPage >= _rowCount))
            ? null
            : _handleNext,
      ),
      // Container(width: 5.0),
    ]);

    // CARD
    return Container(
      height: MediaQuery.of(context).size.height*0.815,
      width: MediaQuery.of(context).size.width ,
      color: kcolorbackground,
      // child: Card(
      //   color: Colors.white,
      //   semanticContainer: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          DefaultTextStyle(
            style: _selectedRowCount > 0
                ? themeData.textTheme.subhead
                    .copyWith(color: themeData.accentColor)
                : themeData.textTheme.title
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
            child: IconTheme.merge(
              data: const IconThemeData(opacity: 0.54),
              child: Ink(
                height: MediaQuery.of(context).size.height * 0.10,
                color: _selectedRowCount > 0
                    ? themeData.secondaryHeaderColor
                    : null,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: startPadding, end: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: headerWidgets,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.57,
            width: MediaQuery.of(context).size.width*0.9,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              dragStartBehavior: widget.dragStartBehavior,
              child: tab.DataTable(
                key: _tableKey,
                columns: widget.columns,
                sortColumnIndex: widget.sortColumnIndex,
                sortAscending: widget.sortAscending,
                onSelectAll: widget.onSelectAll,
                dataRowHeight: widget.dataRowHeight,
                headingRowHeight: widget.headingRowHeight,
                horizontalMargin: widget.horizontalMargin,
                columnSpacing: widget.columnSpacing,
                rows: _getRows(_firstRowIndex, widget.rowsPerPage),
                // dividerThickness: 0,
              ),
            ),
          ),
          DefaultTextStyle(
            style: footerTextStyle,
            child: IconTheme.merge(
              data: const IconThemeData(opacity: 0.54),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: SingleChildScrollView(
                  dragStartBehavior: widget.dragStartBehavior,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: footerWidgets,
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container(child: BottomNavigationBar())),
          // Divider(color: Colors.orange,thickness: 1, height: 1,),
        ]),

        // height: MediaQuery.of(context).size.height * 0.1
      // ),
    );
  }
}
