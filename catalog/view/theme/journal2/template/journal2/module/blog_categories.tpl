<div id="journal-blog-categories-<?php echo $module; ?>" class="journal-blog-categories-<?php echo $module_id; ?> box side-blog blog-category">
    <div class="box-heading"><center><font size="4" style="color:#F97001"><?php echo $heading_title; ?></font></center></div>
    <div class="box-category box-post">
        <center><ul>
            <?php foreach ($categories as $category): ?>
          
                > <a href="<?php echo $category['href']; ?>"><strong><?php echo $category['name']; ?></strong></a> &nbsp;
            
            <?php endforeach; ?>
        </ul></center>
    </div>
</div>