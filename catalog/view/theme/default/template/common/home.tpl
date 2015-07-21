<?php echo $header; ?>

<?php
  date_default_timezone_set("Europe/Sofia");

  $currentDate = date('Y-m-d');
  $currentTime = date('H:i:s');

  # echo "<H1><Center>" . 'The Day Now Is: ' . $currentDate . "<br/>" . "</Center></H1>";
  # echo "<H1><Center>" . 'The Time Now Is: ' . $currentTime . "</Center></H1>";

  preg_match("/([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $currentTime, $match);
  $currentHours = $match[1];

  $zeroArrayChecker = preg_split('//', $currentHours, -1, PREG_SPLIT_NO_EMPTY); 
  if ($zeroArrayChecker[0] == 0) { 
	$currentHours = $zeroArrayChecker[1]; 
  }

  # echo "<H1>" . "$currentHours" . "</H1>";

  $afternoonImage = HTTP_SERVER . "image/data/good_afternoon.png";
  $eveningImage = HTTP_SERVER . "image/data/good_evening.png";
  $currentImage = "";

  if(($currentHours >= 0) && ($currentHours < 12)) {
    $currentImage = $afternoonImage;
  }
  else if(($currentHours >= 12) && ($currentHours < 24)) {
    $currentImage = $eveningImage;
  }
  else {
    echo "<center><H1>" . 'What...? Wrong Time!' . "</H1></center>";
  }

  # echo "<H1>" . "$currentImage" . "</H1>";

  if((filter_var($currentImage, FILTER_VALIDATE_URL)) === FALSE) {
    die("That's Not A Valid URL...!");
  }
  else {
  	?>
  	<center><img src="<?php echo $currentImage; ?>" /></center>
  	<?php
  }

?>

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>