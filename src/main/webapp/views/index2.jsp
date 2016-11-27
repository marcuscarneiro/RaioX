<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="robots" content="noindex">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/views/assets/css/video-js.css">
	<title>Raio-X das Escolas</title>
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/views/assets/css/img/raiox-ico2.png" sizes="16x16">
	<style type="text/css">
		.outer {
			display: table;
			position: absolute;
			height: 100%;
			width: 100%;
		}

		.middle {
			display: table-cell;
			vertical-align: middle;
		}

		.inner {
			margin-left: auto;
			margin-right: auto; 
		}
		
		body {
			margin: 0;
			background: #000;
		}
		
		video {
			position: fixed;
			top: 50%;
			left: 50%;
			min-width: 100%;
			min-height: 100%;
			width: auto;
			height: auto;
			z-index: -100;
			transform: translateX(-50%) translateY(-50%);
			background: url('<%=request.getContextPath()%>/views/assets/css/img/bg.jpg') no-repeat;
			background-size: cover;
			transition: 1s opacity;
		}
		
		.stopfade {
			opacity: .5;
		}
		
		#regis {
			font-family: Agenda-Light, Agenda Light, Agenda, Arial Narrow,
				sans-serif;
			font-weight: 100;
			background: rgba(255, 255, 255, 0.3);
			color: white;
			padding: 2rem;
			width: 33%;
			font-size: 1.2rem;
		}
		
		#regis img {
			width: 100%;
			display: block;
		}
		
		@media screen and (max-width: 500px) {
			div {
				width: 70%;
			}
		}
		
		@media screen and (max-device-width: 800px) {
			html {
				height: 100%;
				background: url('<%=request.getContextPath()%>/views/assets/css/img/bg.jpg') #000 no-repeat	center center fixed;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
			}
			#bgvid {
				display: none;
			}
			
			#regis {
				width: 50%;
			}
		}
	</style>
</head>
<body>
	<div class="outer">
		<div class="middle">
			<video autoplay	poster="<%=request.getContextPath()%>/views/assets/css/img/bg.jpg" id="bgvid" loop>
				<source src="<%=request.getContextPath()%>/views/assets/video/bg.webm" type="video/webm">
				<source src="<%=request.getContextPath()%>/views/assets/video/bg.mp4" type="video/mp4">
			</video>
			<div id="regis" class="inner">
				<img src="<%=request.getContextPath()%>/views/assets/css/img/chamada.jpg">
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/views/assets/js/video.js"></script>
</body>
</html>
