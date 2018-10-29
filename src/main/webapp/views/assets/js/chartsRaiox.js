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
	
	if(viewWidth < 360){
		labelStyle = {
		    	fontFamily: 'Montserrat',
		    	fontSize: '12',
		    	textAlign: 'start',
		    	rotate: Math.PI / 3,
		    	textBaseline: 'middle'
		    };
	} else {
		labelStyle = {
	    	fontFamily: 'Montserrat',
	    	fontSize: '12'
	    };
	}
	
	var chart = new F2.Chart({
		id: 'chartMatriculados',
		pixelRatio: 1
	});
	
	chart.source(dataMat, {
		num: {
			tickCount: 11,
			max: 100000,
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
		label: labelStyle
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

//COMPARATIVO IDEB CAPITAIS
function renderChartCapitais(dataCap, id){
	
	var chart = new F2.Chart({
		id: id,
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
	    },
	    grid: { type: 'line', stroke: '#e8e8e8', lineWidth: 1, lineDash: [ 2 ] }
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

//COMPARATIVO IDEB CAPITAIS I
var dataCapIni = [
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

renderChartCapitais(dataCapIni, 'chartIdebCapI');

//COMPARATIVO IDEB CAPITAIS II
var dataCapFin = [
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
	
	
renderChartCapitais(dataCapFin, 'chartIdebCapII');

//APRENDIZADO
function renderChartNordesteAprIni(data, id){
	var labelStyle;
	if(viewWidth < 460){
		labelStyle = {
		    	fontFamily: 'Montserrat',
		    	fontSize: '10',
		    	textAlign: 'start',
		    	rotate: Math.PI / 3,
		    	textBaseline: 'middle'
		    };
        chartPadding = ['auto', 'auto', 50, 'auto'];
	} else {
		labelStyle = {
	    	fontFamily: 'Montserrat',
	    	fontSize: '10'
	    };
        chartPadding = ['auto', 'auto', 'auto', 'auto'];
	}
	var chart = new F2.Chart({
		id: id,
		pixelRatio: 1,
		padding: chartPadding
	});
	
	chart.source(data, {
		grade: {
			max: 100,
			tickCount: 11,
			formatter: function formatter(val) {
				return val + '%';
			}
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
	    label: labelStyle
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

//APRENDIZADO PORTUGUES I
var dataNorPtIni = [
	{city: 'Teresina', grade: 63},
	{city: 'Fortaleza', grade: 55},
	{city: 'Salvador', grade: 45},
	{city: 'J. Pessoa', grade: 41},
	{city: 'Recife', grade: 40},
	{city: 'Maceió', grade: 38},
	{city: 'Natal', grade: 37},
	{city: 'São Luís', grade: 34},
	{city: 'Aracaju', grade: 33}
];

renderChartNordesteAprIni(dataNorPtIni, 'chartAprPortI');


//APRENDIZADO PORTUGUES II
var dataNorPtFin = [
	{city: 'Teresina', grade: 39},
	{city: 'Fortaleza', grade: 35},
	{city: 'Maceió', grade: 26},
	{city: 'Natal', grade: 25},
	{city: 'Salvador', grade: 24},
	{city: 'J. Pessoa', grade: 24},
	{city: 'Aracaju', grade: 23},
	{city: 'Recife', grade: 20},
	{city: 'São Luís', grade: 19}
];

renderChartNordesteAprIni(dataNorPtFin, 'chartAprPortII');

//APRENDIZADO MATEMATICA I
var dataNorMtIni = [
	{city: 'Teresina', grade: 51},
	{city: 'Fortaleza', grade: 36},
	{city: 'Salvador', grade: 30},
	{city: 'Aracaju', grade: 28},
	{city: 'J. Pessoa', grade: 25},
	{city: 'Recife', grade: 24},
	{city: 'Maceió', grade: 22},
	{city: 'Natal', grade: 22},
	{city: 'São Luís', grade: 17}
];

renderChartNordesteAprIni(dataNorMtIni, 'chartAprMatI');

//APRENDIZADO MATEMATICA II
var dataNorMtFin = [
	{city: 'Teresina', grade: 20},
	{city: 'Fortaleza', grade: 12},
	{city: 'Natal', grade: 11},
	{city: 'Maceió', grade: 10},
	{city: 'Aracaju', grade: 9},
	{city: 'Salvador', grade: 8},
	{city: 'J. Pessoa', grade: 7},
	{city: 'Recife', grade: 7},
	{city: 'São Luís', grade: 5}
];

renderChartNordesteAprIni(dataNorMtFin, 'chartAprMatII');