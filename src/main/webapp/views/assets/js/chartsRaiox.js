function DrawTheChart(ChartData, ChartOptions, ChartId, ChartType) {
	eval('var myLine = new Chart(document.getElementById(ChartId).getContext("2d")).'+ChartType+'(ChartData,ChartOptions);document.getElementById(ChartId).getContext("2d").stroke();');
}

//MATRICULADOS
function renderMatriculados(){

	var dataMat = [
	               {year: '2010', num: 73506},
	               {year: '2011', num: 69533},
	               {year: '2012', num: 66755},
	               {year: '2013', num: 64710},
	               {year: '2014', num: 63559},
	               {year: '2015', num: 62339},
	               {year: '2016', num: 64346},
	               {year: '2017', num: 64840}
	               ];
	
	var chart = new F2.Chart({
		id: 'chartMatriculados',
		pixelRatio: 1
	});
	
	chart.source(dataMat, {
		num: {
			tickCount: 6,
			max: 80000,
			formatter: function formatter(val) {
				if(val > 0){
					return (val.toString().slice(0, -3) + "." +val.toString().slice(-3));
				} else {
					return val;
				}
			}		
		}
	});
	
	chart.axis('num', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
	    }
	})
	
	chart.axis('year', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
		}
	})
	chart.tooltip({
		showItemMarker: false,
		onShow: function onShow(ev) {
			var items = ev.items;
			items[0].name = null;
			items[0].name = items[0].title;
			items[0].value = items[0].value;
		}
	});
	chart.interval().position('year*num').color('#3498da');
	chart.render();
}
renderMatriculados();


//IDEBS
function renderMobileIdebCharts(data, periodo){
	var chart = new F2.Chart({
		id: periodo,
		pixelRatio: 1
	});
	chart.source(data, {
		value: {
			nice: false,
			min: 2,
			max: 6,
			tickCount: 5
		}
	});
	chart.scale('time', {
		tickCount: 5
	});
	chart.axis('time', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
		},
		grid: { type: 'line', stroke: '#e8e8e8', lineWidth: 1, lineDash: [ 2 ] },
		tickLine: { stroke: '#e8e8e8', lineWidth: 1 }
	});
	chart.axis('value', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
		}
	});
	chart.tooltip({
		showCrosshairs: true,
		custom: true,
		onChange: function onChange(obj) {
			var legend = chart.get('legendController').legends.top[0];
			var tooltipItems = obj.items;
			var legendItems = legend.items;
			var map = {};
			legendItems.map(function(item) {
				map[item.name] = _.clone(item);
			});
			tooltipItems.map(function(item) {
				var name = item.name;
				var value = item.value;
				if (map[name]) {
					map[name].value = value;
				}
			});
			legend.setItems(_.values(map));
		},
		onHide: function onHide() {
			var legend = chart.get('legendController').legends.top[0];
			legend.setItems(chart.getLegendItems().type);
		}
	});
	chart.area().position('time*value').shape('smooth').color('type', function(val) {
		if (val === 'Nota') {
	        return '#3498da';
	      } else if (val === 'Meta') {
		        return '#2dcb71';
	      }
    });
	chart.line().position('time*value').shape('smooth').color('type', function(val) {
		if (val === 'Nota') {
	        return '#3498da';
	      } else if (val === 'Meta') {
		        return '#2dcb71';
	      }
    });
	chart.point().position('time*value').color('type', function(val) {
	    if (val === 'Nota') {
	        return '#3498da';
	      } else if (val === 'Meta') {
		        return '#2dcb71';
	      }
	    }).style({
		stroke: '#fff',
		lineWidth: 1
	});
	chart.render();
}

//IDEB FUNDAMENTAL I

var chartDataIni = [{
	time: '2005',
	value: null,
	type: 'Meta'
}, {
	time: '2007',
	value: 3.3,
	type: 'Meta'
}, {
	time: '2009',
	value: 3.7,
	type: 'Meta'
}, {
	time: '2011',
	value: 4.1,
	type: 'Meta'
}, {
	time: '2013',
	value: 4.3,
	type: 'Meta'
}, {
	time: '2015',
	value: 4.6,
	type: 'Meta'
}, {
	time: '2017',
	value: 4.9,
	type: 'Meta'
}, {
	time: '2019',
	value: 5.2,
	type: 'Meta'
}, {
	time: '2021',
	value: 5.5,
	type: 'Meta'
}, {
	time: '2005',
	value: 3.3,
	type: 'Nota'
}, {
	time: '2007',
	value: 3.8,
	type: 'Nota'
}, {
	time: '2009',
	value: 4.1,
	type: 'Nota'
}, {
	time: '2011',
	value: 4.1,
	type: 'Nota'
}, {
	time: '2013',
	value: 4.3,
	type: 'Nota'
}, {
	time: '2015',
	value: 4.6,
	type: 'Nota'
}, {
	time: '2017',
	value: 5,
	type: 'Nota'
}, {
	time: '2019',
	value: null,
	type: 'Nota'
}, {
	time: '2021',
	value: null,
	type: 'Nota'
}
];
renderMobileIdebCharts(chartDataIni, 'chartIdebFunI');

//IDEB FUNDAMENTAL II

var chartDataFin = [{
	time: '2005',
	value: null,
	type: 'Meta'
}, {
	time: '2007',
	value: 2.8,
	type: 'Meta'
}, {
	time: '2009',
	value: 3,
	type: 'Meta'
}, {
	time: '2011',
	value: 3.3,
	type: 'Meta'
}, {
	time: '2013',
	value: 3.6,
	type: 'Meta'
}, {
	time: '2015',
	value: 4,
	type: 'Meta'
}, {
	time: '2017',
	value: 4.3,
	type: 'Meta'
}, {
	time: '2019',
	value: 4.6,
	type: 'Meta'
}, {
	time: '2021',
	value: 4.8,
	type: 'Meta'
}, {
	time: '2005',
	value: 2.8,
	type: 'Nota'
}, {
	time: '2007',
	value: 2.5,
	type: 'Nota'
}, {
	time: '2009',
	value: 2.7,
	type: 'Nota'
}, {
	time: '2011',
	value: 2.9,
	type: 'Nota'
}, {
	time: '2013',
	value: 3.2,
	type: 'Nota'
}, {
	time: '2015',
	value: 3.5,
	type: 'Nota'
}, {
	time: '2017',
	value: 4.1,
	type: 'Nota'
}, {
	time: '2019',
	value: null,
	type: 'Nota'
}, {
	time: '2021',
	value: null,
	type: 'Nota'
}
];
renderMobileIdebCharts(chartDataFin, 'chartIdebFunII');

//COMPARATIVO IDEB CAPITAIS I
function renderChartCapitaisIni(){
	var dataCap = [
		{city: 'Teresina', grade: 6.8},
		{city: 'Palmas', grade: 6.6},
		{city: 'Rio Branco', grade: 6.5},
		{city: 'Curitiba', grade: 6.4},
		{city: 'Belo Horizonte', grade: 6.3},
		{city: 'Florianópolis', grade: 6.2},
		{city: 'Fortaleza', grade: 6.0},
		{city: 'São Paulo', grade: 6.0},
		{city: 'Manaus', grade: 5.8},
		{city: 'Goiânia', grade: 5.8},
		{city: 'Boa Vista', grade: 5.8},
		{city: 'Cuiabá', grade: 5.7},
		{city: 'Campo Grande', grade: 5.7},
		{city: 'Rio de Janeiro', grade: 5.7},
		{city: 'Vitória', grade: 5.6},
		{city: 'Salvador', grade: 5.3},
		{city: 'Belém', grade: 5.1},
		{city: 'Porto Velho', grade: 5.1},
		{city: 'Maceió', grade: 5.0},
		{city: 'Recife', grade: 5.0},
		{city: 'João Pessoa', grade: 4.9},
		{city: 'Natal', grade: 4.8},
		{city: 'Macapá', grade: 4.6},
		{city: 'São Luís', grade: 4.6},
		{city: 'Aracaju', grade: 4.6}
	];
	
	var chart = new F2.Chart({
		id: 'chartIdebCapI',
		pixelRatio: 1,
		padding: ['auto', 'auto', 90, 'auto']
	});
	
	chart.source(dataCap, {
		grade: {
			tickCount: 12,
			max: 10		
		}
	});
	chart.legend(false);
	chart.axis('grade', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
	    }
	})
	
	chart.axis('city', {
	    label: {
	    	fontFamily: 'Montserrat',
	    	fontSize: '12',
	        textAlign: 'start',
	        textBaseline: 'middle',
	        rotate: Math.PI / 3
	      }
	})
	chart.tooltip({
		showItemMarker: false,
		onShow: function onShow(ev) {
			var items = ev.items;
			items[0].name = null;
			items[0].name = items[0].title;
			items[0].value = items[0].value;
		}
	});
	chart.interval().position('city*grade').color('city', function(val) {
		if(val === 'Recife') {
			return '#ff0000';
		} else {
			return '#3498da';
		}
	});
	chart.render();
}
renderChartCapitaisIni();

//COMPARATIVO IDEB CAPITAIS II
function renderChartCapitaisFin(){
	var dataCap = [
		{city: 'Teresina', grade: 6.0},
		{city: 'Palmas', grade: 5.8},
		{city: 'Curitiba', grade: 5.2},
		{city: 'Florianópolis', grade: 5.0},
		{city: 'Campo Grande', grade: 5.0},
		{city: 'Macapá', grade: 5.0},
		{city: 'Belo Horizonte', grade: 4.9},
		{city: 'Fortaleza', grade: 4.9},
		{city: 'Manaus', grade: 4.7},
		{city: 'Goiânia', grade: 4.7},
		{city: 'Rio de Janeiro', grade: 4.7},
		{city: 'Cuiabá', grade: 4.6},
		{city: 'Vitória', grade: 4.4},
		{city: 'Belém', grade: 4.3},
		{city: 'São Paulo', grade: 4.2},
		{city: 'Recife', grade: 4.1},
		{city: 'João Pessoa', grade: 4.0},
		{city: 'Salvador', grade: 3.9},
		{city: 'Porto Velho', grade: 3.9},
		{city: 'Maceió', grade: 3.8},
		{city: 'São Luís', grade: 3.8},
		{city: 'Aracaju', grade: 3.7},
		{city: 'Natal', grade: 3.5}
	];
	
	var chart = new F2.Chart({
		id: 'chartIdebCapII',
		pixelRatio: 1,
		padding: ['auto', 'auto', 90, 'auto']
	});
	
	chart.source(dataCap, {
		grade: {
			tickCount: 12,
			max: 10		
		}
	});
	chart.legend(false);
	chart.axis('grade', {
		label: {
			fontFamily: 'Montserrat',
			fontSize: '12'
	    }
	})
	
	chart.axis('city', {
	    label: {
	    	fontFamily: 'Montserrat',
	    	fontSize: '12',
	        textAlign: 'start',
	        textBaseline: 'middle',
	        rotate: Math.PI / 3
	      }
	})
	chart.tooltip({
		showItemMarker: false,
		onShow: function onShow(ev) {
			var items = ev.items;
			items[0].name = null;
			items[0].name = items[0].title;
			items[0].value = items[0].value;
		}
	});
	chart.interval().position('city*grade').color('city', function(val) {
		if(val === 'Recife') {
			return '#ff0000';
		} else {
			return '#3498da';
		}
	});
	chart.render();
}
renderChartCapitaisFin();

//APRENDIZADO PORTUGUES I
function MoreChartOptions() {}
var ChartData = {
    labels: ["Teresina",
        "Fortaleza", "Salvador", "J. Pessoa", "Recife", "Maceió", "Natal", "São Luís", "Aracaju",
    ],
    datasets: [{
        fillColor: ["rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", 'rgba(237,28,36,1)', "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)"], 
        strokeColor: "rgba(52,152,219,0.5)",
        pointColor: "rgba(52,152,219,1)",
        markerShape: "circle",
        pointStrokeColor: "rgba(255,255,255,1)",
        data: [63, 55, 45, 41, 40, 38, 37, 34, 33, ],
        title: ""
    }, ]
};
ChartOptions = {
    canvasBackgroundColor: 'rgba(255,255,255,1.00)',
    decimalSeparator: ".",
    thousandSeparator: ",",
    spaceLeft: 12,
    spaceRight: 12,
    spaceTop: 12,
    spaceBottom: 12,
    canvasBorders: false,
    canvasBordersWidth: 1,
    canvasBordersStyle: "solid",
    canvasBordersColor: "rgba(0,0,0,1)",
    scaleLabel: "<%=value+''%>",
    yAxisMinimumInterval: 1,
    scaleShowLabels: true,
    scaleShowLine: true,
    scaleLineStyle: "solid",
    scaleLineWidth: 1,
    scaleLineColor: "rgba(0,0,0,0.6)",
    scaleOverlay: false,
    scaleOverride: false,
    scaleSteps: 10,
    scaleStepWidth: 10,
    scaleStartValue: 0,
    legend: true,
    maxLegendCols: 5,
    legendBlockSize: 15,
    legendFillColor: 'rgba(255,255,255,0.00)',
    legendColorIndicatorStrokeWidth: 1,
    legendPosX: -2,
    legendPosY: 4,
    legendXPadding: 0,
    legendYPadding: 0,
    legendBorders: false,
    legendBordersWidth: 1,
    legendBordersStyle: "solid",
    legendBordersColors: "rgba(102,102,102,1)",
    legendBordersSpaceBefore: 5,
    legendBordersSpaceLeft: 5,
    legendBordersSpaceRight: 5,
    legendBordersSpaceAfter: 5,
    legendSpaceBeforeText: 5,
    legendSpaceLeftText: 5,
    legendSpaceRightText: 5,
    legendSpaceAfterText: 5,
    legendSpaceBetweenBoxAndText: 5,
    legendSpaceBetweenTextHorizontal: 5,
    legendSpaceBetweenTextVertical: 5,
    legendFontFamily: "'Open Sans'",
    legendFontStyle: "normal normal",
    legendFontColor: "rgba(0,0,0,1)",
    legendFontSize: 15,
    showYAxisMin: false,
    rotateLabels: "smart",
    xAxisBottom: true,
    yAxisLeft: true,
    yAxisRight: false,
    graphTitleSpaceBefore: 5,
    graphTitleSpaceAfter: 5,
    graphTitleBorders: false,
    graphTitleBordersXSpace: 1,
    graphTitleBordersYSpace: 1,
    graphTitleBordersWidth: 1,
    graphTitleBordersStyle: "solid",
    graphTitleBordersColor: "rgba(0,0,0,1)",
    graphTitle: "Fundamental I",
    graphTitleFontFamily: "'Open Sans'",
    graphTitleFontStyle: "normal normal",
    graphTitleFontColor: "rgba(52,152,219,1)",
    graphTitleFontSize: 26,
    scaleFontFamily: "'Open Sans'",
    scaleFontStyle: "normal normal",
    scaleFontColor: "rgba(0,0,0,1)",
    scaleFontSize: 12,
    pointLabelFontFamily: "'Open Sans'",
    pointLabelFontStyle: "normal normal",
    pointLabelFontColor: "rgba(102,102,102,1)",
    pointLabelFontSize: 12,
    angleShowLineOut: true,
    angleLineStyle: "solid",
    angleLineWidth: 1,
    angleLineColor: "rgba(0,0,0,0.1)",
    percentageInnerCutout: 50,
    scaleShowGridLines: true,
    scaleGridLineStyle: "solid",
    scaleGridLineWidth: 1,
    scaleGridLineColor: "rgba(0,0,0,0.1)",
    scaleXGridLinesStep: 1,
    scaleYGridLinesStep: 1,
    segmentShowStroke: true,
    segmentStrokeStyle: "solid",
    segmentStrokeWidth: 2,
    segmentStrokeColor: "rgba(255,255,255,1.00)",
    datasetStroke: true,
    datasetFill: true,
    datasetStrokeStyle: "solid",
    datasetStrokeWidth: 2,
    bezierCurve: true,
    bezierCurveTension: 0.4,
    pointDotStrokeStyle: "solid",
    pointDotStrokeWidth: 1,
    pointDotRadius: 3,
    pointDot: true,
    scaleTickSizeBottom: 5,
    scaleTickSizeTop: 5,
    scaleTickSizeLeft: 5,
    scaleTickSizeRight: 5,
    graphMin: 0,
    graphMax: 99,
    barShowStroke: false,
    barBorderRadius: 0,
    barStrokeStyle: "solid",
    barStrokeWidth: 1,
    barValueSpacing: 15,
    barDatasetSpacing: 0,
    scaleShowLabelBackdrop: true,
    scaleBackdropColor: 'rgba(255,255,255,0.75)',
    scaleBackdropPaddingX: 2,
    scaleBackdropPaddingY: 2,
    responsive: true,
    responsiveMaxWidth: 700,
	responsiveMaxHeight: 400,
	responsiveMinWidth : 350,
	responsiveMinHeight : 200,
    onAnimationComplete: function() {
        MoreChartOptions()
    }
};
DrawTheChart(ChartData, ChartOptions, "chartAprPortI", "Bar");

//APRENDIZADO PORTUGUES II
function MoreChartOptions() {}
var ChartData = {
		labels: ["Teresina",
		         "Fortaleza", "Maceió", "Natal", "Salvador", "J. Pessoa", "Aracaju", "Recife", "São Luís",
		     ],
    datasets: [{
        fillColor: ["rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(237,28,36,1)", "rgba(52,152,219,1)"],
        strokeColor: "rgba(52,152,219,0.5)",
        pointColor: "rgba(52,152,219,1)",
        markerShape: "circle",
        pointStrokeColor: "rgba(255,255,255,1)",
        data: [39, 35, 26, 25, 24, 24, 23, 20, 19, ],
        title: ""
    }, ]
};
ChartOptions = {
    canvasBackgroundColor: 'rgba(255,255,255,1.00)',
    decimalSeparator: ".",
    thousandSeparator: ",",
    spaceLeft: 12,
    spaceRight: 12,
    spaceTop: 12,
    spaceBottom: 12,
    canvasBorders: false,
    canvasBordersWidth: 1,
    canvasBordersStyle: "solid",
    canvasBordersColor: "rgba(0,0,0,1)",
    scaleLabel: "<%=value+''%>",
    yAxisMinimumInterval: 1,
    scaleShowLabels: true,
    scaleShowLine: true,
    scaleLineStyle: "solid",
    scaleLineWidth: 1,
    scaleLineColor: "rgba(0,0,0,0.6)",
    scaleOverlay: false,
    scaleOverride: false,
    scaleSteps: 10,
    scaleStepWidth: 10,
    scaleStartValue: 0,
    legend: true,
    maxLegendCols: 5,
    legendBlockSize: 15,
    legendFillColor: 'rgba(255,255,255,0.00)',
    legendColorIndicatorStrokeWidth: 1,
    legendPosX: -2,
    legendPosY: 4,
    legendXPadding: 0,
    legendYPadding: 0,
    legendBorders: false,
    legendBordersWidth: 1,
    legendBordersStyle: "solid",
    legendBordersColors: "rgba(102,102,102,1)",
    legendBordersSpaceBefore: 5,
    legendBordersSpaceLeft: 5,
    legendBordersSpaceRight: 5,
    legendBordersSpaceAfter: 5,
    legendSpaceBeforeText: 5,
    legendSpaceLeftText: 5,
    legendSpaceRightText: 5,
    legendSpaceAfterText: 5,
    legendSpaceBetweenBoxAndText: 5,
    legendSpaceBetweenTextHorizontal: 5,
    legendSpaceBetweenTextVertical: 5,
    legendFontFamily: "'Open Sans'",
    legendFontStyle: "normal normal",
    legendFontColor: "rgba(0,0,0,1)",
    legendFontSize: 15,
    showYAxisMin: false,
    rotateLabels: "smart",
    xAxisBottom: true,
    yAxisLeft: true,
    yAxisRight: false,
    graphTitleSpaceBefore: 5,
    graphTitleSpaceAfter: 5,
    graphTitleBorders: false,
    graphTitleBordersXSpace: 1,
    graphTitleBordersYSpace: 1,
    graphTitleBordersWidth: 1,
    graphTitleBordersStyle: "solid",
    graphTitleBordersColor: "rgba(0,0,0,1)",
    graphTitle: "Fundamental II",
    graphTitleFontFamily: "'Open Sans'",
    graphTitleFontStyle: "normal normal",
    graphTitleFontColor: "rgba(52,152,219,1)",
    graphTitleFontSize: 26,
    scaleFontFamily: "'Open Sans'",
    scaleFontStyle: "normal normal",
    scaleFontColor: "rgba(0,0,0,1)",
    scaleFontSize: 12,
    pointLabelFontFamily: "'Open Sans'",
    pointLabelFontStyle: "normal normal",
    pointLabelFontColor: "rgba(102,102,102,1)",
    pointLabelFontSize: 12,
    angleShowLineOut: true,
    angleLineStyle: "solid",
    angleLineWidth: 1,
    angleLineColor: "rgba(0,0,0,0.1)",
    percentageInnerCutout: 50,
    scaleShowGridLines: true,
    scaleGridLineStyle: "solid",
    scaleGridLineWidth: 1,
    scaleGridLineColor: "rgba(0,0,0,0.1)",
    scaleXGridLinesStep: 1,
    scaleYGridLinesStep: 1,
    segmentShowStroke: true,
    segmentStrokeStyle: "solid",
    segmentStrokeWidth: 2,
    segmentStrokeColor: "rgba(255,255,255,1.00)",
    datasetStroke: true,
    datasetFill: true,
    datasetStrokeStyle: "solid",
    datasetStrokeWidth: 2,
    bezierCurve: true,
    bezierCurveTension: 0.4,
    pointDotStrokeStyle: "solid",
    pointDotStrokeWidth: 1,
    pointDotRadius: 3,
    pointDot: true,
    scaleTickSizeBottom: 5,
    scaleTickSizeTop: 5,
    scaleTickSizeLeft: 5,
    scaleTickSizeRight: 5,
    graphMin: 0,
    graphMax: 99,
    barShowStroke: false,
    barBorderRadius: 0,
    barStrokeStyle: "solid",
    barStrokeWidth: 1,
    barValueSpacing: 15,
    barDatasetSpacing: 0,
    scaleShowLabelBackdrop: true,
    scaleBackdropColor: 'rgba(255,255,255,0.75)',
    scaleBackdropPaddingX: 2,
    scaleBackdropPaddingY: 2,
    responsive: true,
    responsiveMaxWidth: 700,
	responsiveMaxHeight: 400,
	responsiveMinWidth : 350,
	responsiveMinHeight : 200,
    onAnimationComplete: function() {
        MoreChartOptions()
    }
};
DrawTheChart(ChartData, ChartOptions, "chartAprPortII", "Bar");

//APRENDIZADO MATEMATICA I
function MoreChartOptions() {}
var ChartData = {
    labels: ["Teresina",
        "Fortaleza", "Salvador", "Aracaju", "J. Pessoa", "Recife", "Maceió", "Natal ", "São Luís",
    ],
    datasets: [{
    	fillColor: ["rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(237,28,36,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)"],
        strokeColor: "rgba(52,152,219,0.5)",
        pointColor: "rgba(52,152,219,1)",
        markerShape: "circle",
        pointStrokeColor: "rgba(255,255,255,1)",
        data: [51, 36, 30, 28, 25, 24, 22, 22, 17, ],
        title: ""
    }, ]
};
ChartOptions = {
    canvasBackgroundColor: 'rgba(255,255,255,1.00)',
    decimalSeparator: ".",
    thousandSeparator: ",",
    spaceLeft: 12,
    spaceRight: 12,
    spaceTop: 12,
    spaceBottom: 12,
    canvasBorders: false,
    canvasBordersWidth: 1,
    canvasBordersStyle: "solid",
    canvasBordersColor: "rgba(0,0,0,1)",
    scaleLabel: "<%=value+''%>",
    yAxisMinimumInterval: 1,
    scaleShowLabels: true,
    scaleShowLine: true,
    scaleLineStyle: "solid",
    scaleLineWidth: 1,
    scaleLineColor: "rgba(0,0,0,0.6)",
    scaleOverlay: false,
    scaleOverride: false,
    scaleSteps: 10,
    scaleStepWidth: 10,
    scaleStartValue: 0,
    legend: true,
    maxLegendCols: 5,
    legendBlockSize: 15,
    legendFillColor: 'rgba(255,255,255,0.00)',
    legendColorIndicatorStrokeWidth: 1,
    legendPosX: -2,
    legendPosY: 4,
    legendXPadding: 0,
    legendYPadding: 0,
    legendBorders: false,
    legendBordersWidth: 1,
    legendBordersStyle: "solid",
    legendBordersColors: "rgba(102,102,102,1)",
    legendBordersSpaceBefore: 5,
    legendBordersSpaceLeft: 5,
    legendBordersSpaceRight: 5,
    legendBordersSpaceAfter: 5,
    legendSpaceBeforeText: 5,
    legendSpaceLeftText: 5,
    legendSpaceRightText: 5,
    legendSpaceAfterText: 5,
    legendSpaceBetweenBoxAndText: 5,
    legendSpaceBetweenTextHorizontal: 5,
    legendSpaceBetweenTextVertical: 5,
    legendFontFamily: "'Open Sans'",
    legendFontStyle: "normal normal",
    legendFontColor: "rgba(0,0,0,1)",
    legendFontSize: 15,
    showYAxisMin: false,
    rotateLabels: "smart",
    xAxisBottom: true,
    yAxisLeft: true,
    yAxisRight: false,
    graphTitleSpaceBefore: 5,
    graphTitleSpaceAfter: 5,
    graphTitleBorders: false,
    graphTitleBordersXSpace: 1,
    graphTitleBordersYSpace: 1,
    graphTitleBordersWidth: 1,
    graphTitleBordersStyle: "solid",
    graphTitleBordersColor: "rgba(0,0,0,1)",
    graphTitle: "Fundamental I",
    graphTitleFontFamily: "'Open Sans'",
    graphTitleFontStyle: "normal normal",
    graphTitleFontColor: "rgba(52,152,219,1)",
    graphTitleFontSize: 26,
    scaleFontFamily: "'Open Sans'",
    scaleFontStyle: "normal normal",
    scaleFontColor: "rgba(0,0,0,1)",
    scaleFontSize: 12,
    pointLabelFontFamily: "'Open Sans'",
    pointLabelFontStyle: "normal normal",
    pointLabelFontColor: "rgba(102,102,102,1)",
    pointLabelFontSize: 12,
    angleShowLineOut: true,
    angleLineStyle: "solid",
    angleLineWidth: 1,
    angleLineColor: "rgba(0,0,0,0.1)",
    percentageInnerCutout: 50,
    scaleShowGridLines: true,
    scaleGridLineStyle: "solid",
    scaleGridLineWidth: 1,
    scaleGridLineColor: "rgba(0,0,0,0.1)",
    scaleXGridLinesStep: 1,
    scaleYGridLinesStep: 1,
    segmentShowStroke: true,
    segmentStrokeStyle: "solid",
    segmentStrokeWidth: 2,
    segmentStrokeColor: "rgba(255,255,255,1.00)",
    datasetStroke: true,
    datasetFill: true,
    datasetStrokeStyle: "solid",
    datasetStrokeWidth: 2,
    bezierCurve: true,
    bezierCurveTension: 0.4,
    pointDotStrokeStyle: "solid",
    pointDotStrokeWidth: 1,
    pointDotRadius: 3,
    pointDot: true,
    scaleTickSizeBottom: 5,
    scaleTickSizeTop: 5,
    scaleTickSizeLeft: 5,
    scaleTickSizeRight: 5,
    graphMin: 0,
    graphMax: 99,
    barShowStroke: false,
    barBorderRadius: 0,
    barStrokeStyle: "solid",
    barStrokeWidth: 1,
    barValueSpacing: 15,
    barDatasetSpacing: 0,
    scaleShowLabelBackdrop: true,
    scaleBackdropColor: 'rgba(255,255,255,0.75)',
    scaleBackdropPaddingX: 2,
    scaleBackdropPaddingY: 2,
    responsive: true,
    responsiveMaxWidth: 700,
	responsiveMaxHeight: 400,
	responsiveMinWidth : 350,
	responsiveMinHeight : 200,
    onAnimationComplete: function() {
        MoreChartOptions()
    }
};
DrawTheChart(ChartData, ChartOptions, "chartAprMatI", "Bar");

//APRENDIZADO MATEMÁTICA II
function MoreChartOptions() {}
var ChartData = {
    labels: ["Teresina",
        "Fortaleza", "Natal", "Maceió", "Aracajú", "Salvador", "J. Pessoa", "Recife", "São Luís",
    ],
    datasets: [{
    	fillColor: ["rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(52,152,219,1)", "rgba(237,28,36,1)", "rgba(52,152,219,1)"],
        strokeColor: "rgba(52,152,219,0.5)",
        pointColor: "rgba(52,152,219,1)",
        markerShape: "circle",
        pointStrokeColor: "rgba(255,255,255,1)",
        data: [20, 12, 11, 10, 9, 8, 7, 7, 5, ],
        title: ""
    }, ]
};
ChartOptions = {
    canvasBackgroundColor: 'rgba(255,255,255,1.00)',
    decimalSeparator: ".",
    thousandSeparator: ",",
    spaceLeft: 12,
    spaceRight: 12,
    spaceTop: 12,
    spaceBottom: 12,
    canvasBorders: false,
    canvasBordersWidth: 1,
    canvasBordersStyle: "solid",
    canvasBordersColor: "rgba(0,0,0,1)",
    scaleLabel: "<%=value+''%>",
    yAxisMinimumInterval: 1,
    scaleShowLabels: true,
    scaleShowLine: true,
    scaleLineStyle: "solid",
    scaleLineWidth: 1,
    scaleLineColor: "rgba(0,0,0,0.6)",
    scaleOverlay: false,
    scaleOverride: false,
    scaleSteps: 10,
    scaleStepWidth: 10,
    scaleStartValue: 0,
    legend: true,
    maxLegendCols: 5,
    legendBlockSize: 15,
    legendFillColor: 'rgba(255,255,255,0.00)',
    legendColorIndicatorStrokeWidth: 1,
    legendPosX: -2,
    legendPosY: 4,
    legendXPadding: 0,
    legendYPadding: 0,
    legendBorders: false,
    legendBordersWidth: 1,
    legendBordersStyle: "solid",
    legendBordersColors: "rgba(102,102,102,1)",
    legendBordersSpaceBefore: 5,
    legendBordersSpaceLeft: 5,
    legendBordersSpaceRight: 5,
    legendBordersSpaceAfter: 5,
    legendSpaceBeforeText: 5,
    legendSpaceLeftText: 5,
    legendSpaceRightText: 5,
    legendSpaceAfterText: 5,
    legendSpaceBetweenBoxAndText: 5,
    legendSpaceBetweenTextHorizontal: 5,
    legendSpaceBetweenTextVertical: 5,
    legendFontFamily: "'Open Sans'",
    legendFontStyle: "normal normal",
    legendFontColor: "rgba(0,0,0,1)",
    legendFontSize: 15,
    showYAxisMin: false,
    rotateLabels: "smart",
    xAxisBottom: true,
    yAxisLeft: true,
    yAxisRight: false,
    graphTitleSpaceBefore: 5,
    graphTitleSpaceAfter: 5,
    graphTitleBorders: false,
    graphTitleBordersXSpace: 1,
    graphTitleBordersYSpace: 1,
    graphTitleBordersWidth: 1,
    graphTitleBordersStyle: "solid",
    graphTitleBordersColor: "rgba(0,0,0,1)",
    graphTitle: "Fundamental II",
    graphTitleFontFamily: "'Open Sans'",
    graphTitleFontStyle: "normal normal",
    graphTitleFontColor: "rgba(52,152,219,1)",
    graphTitleFontSize: 26,
    scaleFontFamily: "'Open Sans'",
    scaleFontStyle: "normal normal",
    scaleFontColor: "rgba(0,0,0,1)",
    scaleFontSize: 12,
    pointLabelFontFamily: "'Open Sans'",
    pointLabelFontStyle: "normal normal",
    pointLabelFontColor: "rgba(102,102,102,1)",
    pointLabelFontSize: 12,
    angleShowLineOut: true,
    angleLineStyle: "solid",
    angleLineWidth: 1,
    angleLineColor: "rgba(0,0,0,0.1)",
    percentageInnerCutout: 50,
    scaleShowGridLines: true,
    scaleGridLineStyle: "solid",
    scaleGridLineWidth: 1,
    scaleGridLineColor: "rgba(0,0,0,0.1)",
    scaleXGridLinesStep: 1,
    scaleYGridLinesStep: 1,
    segmentShowStroke: true,
    segmentStrokeStyle: "solid",
    segmentStrokeWidth: 2,
    segmentStrokeColor: "rgba(255,255,255,1.00)",
    datasetStroke: true,
    datasetFill: true,
    datasetStrokeStyle: "solid",
    datasetStrokeWidth: 2,
    bezierCurve: true,
    bezierCurveTension: 0.4,
    pointDotStrokeStyle: "solid",
    pointDotStrokeWidth: 1,
    pointDotRadius: 3,
    pointDot: true,
    scaleTickSizeBottom: 5,
    scaleTickSizeTop: 5,
    scaleTickSizeLeft: 5,
    scaleTickSizeRight: 5,
    graphMin: 0,
    graphMax: 99,
    barShowStroke: false,
    barBorderRadius: 0,
    barStrokeStyle: "solid",
    barStrokeWidth: 1,
    barValueSpacing: 15,
    barDatasetSpacing: 0,
    scaleShowLabelBackdrop: true,
    scaleBackdropColor: 'rgba(255,255,255,0.75)',
    scaleBackdropPaddingX: 2,
    scaleBackdropPaddingY: 2,
    responsive: true,
    responsiveMaxWidth: 700,
	responsiveMaxHeight: 400,
	responsiveMinWidth : 350,
	responsiveMinHeight : 200,
    onAnimationComplete: function() {
        MoreChartOptions()
    }
};
DrawTheChart(ChartData, ChartOptions, "chartAprMatII", "Bar");