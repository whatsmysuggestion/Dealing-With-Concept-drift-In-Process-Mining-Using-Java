<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sequential Anomaly Detection</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400-Myriad_Pro_700-Myriad_Pro_italic_400-Myriad_Pro_italic_700.font.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.easing.compatibility.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
</head>
<body>
	
<div id="wrapper"> 
  <div id="header"> 
    <h2><font color="#00FFFF" size="+2">Sequential Anomaly Detection in the Presence of 
      &nbsp;<strong>Noise and Limited Feedback</strong></font></h2>
    </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="index.html" class="current"><span class="link">home</span></a> 
          <ul>
            <li><a href="">some other link</a></li>
            <li><a href="">drop down link example</a></li>
            <li><a href="">add anything</a></li>
            <li><a href="">this will hopefully work</a></li>
          </ul>
        </li>
        <li><a href="about.html"><span class="link">about</span></a></li>
        <li><a href="portfolio.html"><span class="link">portfolio</span></a></li>
        <li><a href="blog.html"><span class="link">blog</span></a> 
          <ul>
            <li><a href="">some other link</a></li>
            <li><a href="">drop down link example</a></li>
            <li><a href="">add anything</a></li>
            <li><a href="">this will hopefully work</a></li>
          </ul>
        </li>
        <li><a href="contact.html"><span class="link">contact</span></a></li>
      </ul>
    </div>
  </div>
  <div id="hold"> 

    <div id="content"> 
      <div id="leftcolumn"> 
        <h2>Abstract</h2>
        <p align="justify"> This paper describes a methodology for detecting anomalies from sequentially observed and potentially noisy
data. The proposed approach consists of two main elements: (1) filtering, or assigning a belief or likelihood to each successive
measurement based upon our ability to predict it from previous noisy observations, and (2) hedging, or flagging
potential anomalies by comparing the current belief against a time-varying and data-adaptive threshold. The threshold is
adjusted based on the available feedback from an end user. Our algorithms, which combine universal prediction with recent
work on online convex programming, do not require computing posterior distributions given all current observations and involve
simple primal-dual parameter updates. At the heart of the proposed approach lie exponential-family models which can
be used in a wide variety of contexts and applications, and which yield methods that achieve sublinear per-round regret
against both static and slowly varying product distributions with marginals drawn from the same exponential family. Moreover,
the regret against static distributions coincides with the minimax value of the corresponding online strongly convex game. We
also prove bounds on the number of mistakes made during the hedging step relative to the best offline choice of the threshold
with access to all estimated beliefs and feedback signals. We validate the theory on synthetic data drawn from a time-varying
distribution over binary vectors of high dimensionality, as well as on the Enron email dataset. </p>
        
        
        
      </div>
      <div id="rightcolumn"> 
        <h3></h3>
    
        <h3>Login here</h3>
      
        <div class="outerhol"> 
          
            <form action="" method="get">
				<table>
					<tr>
						<td><input name="search" type="name" class="textfield"></td>
						<td>User Name</td>
					</tr>
					<tr>
						<td><input name="search" type="password" class="textfield"></td>
						<td>Password</td>
					</tr>
					<tr>
						
						<td colspan="2" align="center"><input name="search" type="button" value="Login" class="button"></td>
					</tr>
				</table>
          
              
            </form>
			<h3></h3>
			<h3>New User Registration</h3>
			<form action="" method="get">
				<table>
					<tr>
						<td>Name:</td>
						<td><input name="search" type="name" class="textfield"></td>						
					</tr>
					<tr>
						<td>Email:</td>
						<td><input name="search" type="email" class="textfield"></td>						
					</tr>
					<tr>
						<td>Password:</td>
						<td><input name="search" type="password" class="textfield"></td>						
					</tr>
					<tr>
						<td>Phone</td>
						<td><input name="search" type="phone" class="textfield"></td>						
					</tr>
					<tr>
						
						<td colspan="2" align="center"><input name="search" type="button" value="Register" class="button"></td>
					</tr>
				</table>
          
              
            </form>
          
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <div id="footer"> 
      <div class="box"> 
        <h3>latest updates</h3>
        <ul>
          <li><a href="">some example link</a></li>
          <li><a href="">another link</a></li>
          <li><a href="">guess what this is</a></li>
          <li><a href="">yep another link</a></li>
          <li><a href="">you got it in one</a></li>
        </ul>
      </div>
      <div class="box"> 
        <h3>latest links</h3>
        <ul>
          <li><a href="">some example link</a></li>
          <li><a href="">another link</a></li>
          <li><a href="">guess what this is</a></li>
          <li><a href="">yep another link</a></li>
          <li><a href="">you got it in one</a></li>
        </ul>
      </div>
      <div class="box2"> 
        <h3>quick about</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis mi 
          in tortor volutpat tempus. Maecenas imperdiet, eros facilisis scelerisque 
          fringilla, libero nibh scelerisque nibh, eu semper nibh diam in arcu. 
          Donec consequat mollis sollicitudin. Maecenas ac felis eu libero porttitor 
          interdum. Aliquam erat volutpat.</p>
      </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"><p align="center">Sequential Anomaly Detection in the Presence of Noise and Limited Feedback</p></div>
  </div>
</div>
</body>
</html>
