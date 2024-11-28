<div class="panel panel-default">
  <div class="panel-heading" style="background-color:#ffffff">
    <div class="pull-right" style="position: relative;"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> <i class="caret"></i></a>
      <ul id="range" class="dropdown-menu dropdown-menu-right">
        <li><a href="day"><?php echo $text_day; ?></a></li>
        <li><a href="week"><?php echo $text_week; ?></a></li>
        <li class="active"><a href="month"><?php echo $text_month; ?></a></li>
        <li><a href="year"><?php echo $text_year; ?></a></li>
      </ul>
    </div>
    <h3 class="panel-title" style="font-size:18px;color:#4F4F4F"><?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="chart-sale" style="width: 100%; height: 260px;"></div>
  </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  function drawChart(data) {
    var data = google.visualization.arrayToDataTable(data);

    var options = {
      chart: {
        title: '',
        subtitle: '',
      },
      vAxis: {
        viewWindow: {
          min:0
        }
      },
      colors: ['#2281e2','#1db5a8'],
      bars: 'vertical' // Required for Material Bar Charts.
    };

    var chart = new google.charts.Bar(document.getElementById('chart-sale'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
  }

  $('#range a').on('click', function(e) {
  	e.preventDefault();

  	$(this).parent().parent().find('li').removeClass('active');

  	$(this).parent().addClass('active');

  	$.ajax({
  		type: 'get',
  		url: 'index.php?route=account/customerpartner/dashboards/chart/chart&range=' + $(this).attr('href'),
  		dataType: 'json',
  		success: function(json) {
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(function() { drawChart(json); });
  		},
      error: function(xhr, ajaxOptions, thrownError) {
         alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  	});
  });
  $('#range .active a').trigger('click');
//--></script>
