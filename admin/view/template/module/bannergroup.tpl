<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-bannergroup" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        	</div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bannergroup" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_banner; ?></label>
                        <div class="col-sm-10">
                        <select name="banner_id" id="input-banner" class="form-control">
                            <?php foreach ($banners as $banner) { ?>
                                <?php if ($banner['banner_id'] == $banner_id) { ?>
                                    <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-banner_num"><?php echo $entry_dimension; ?></label>
                        <div class="col-sm-10">
                            <select id="input-banner_num" name="banner_num" class="form-control">
                                <option value="Select" selected="selected" >Select</option>
                                <?php for ($i = 1; $i <= 6; $i++) {
                                    ($banner_num == $i) ? $currentnum = 'selected' : $currentnum = ''; ?>
                                    <option value="<?php echo $i; ?>" <?php echo $currentnum; ?>><?php echo $i; ?></option>'; 
                                <?php } ?>
                            </select>
                            <?php if ($error_dimension) { ?>
                                <div class="text-danger"><?php echo $error_dimension; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-toppadding"><?php echo $entry_toppadding; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="toppadding" value="<?php echo $toppadding; ?>" placeholder="<?php echo $entry_toppadding; ?>" id="input-toppadding" class="form-control" />px
                            <?php if ($error_toppadding) { ?>
                                <div class="text-danger"><?php echo $error_toppadding; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-rightpadding"><?php echo $entry_rightpadding; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="rightpadding" value="<?php echo $rightpadding; ?>" placeholder="<?php echo $entry_rightpadding; ?>" id="input-rightpadding" class="form-control" />px
                            <?php if ($error_rightpadding) { ?>
                                <div class="text-danger"><?php echo $error_rightpadding; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-bottompadding"><?php echo $entry_bottompadding; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="bottompadding" value="<?php echo $bottompadding; ?>" placeholder="<?php echo $entry_bottompadding; ?>" id="input-bottompadding" class="form-control" />px
                            <?php if ($error_bottompadding) { ?>
                                <div class="text-danger"><?php echo $error_bottompadding; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-leftpadding"><?php echo $entry_leftpadding; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="leftpadding" value="<?php echo $leftpadding; ?>" placeholder="<?php echo $entry_leftpadding; ?>" id="input-leftpadding" class="form-control" />px
                            <?php if ($error_leftpadding) { ?>
                                <div class="text-danger"><?php echo $error_leftpadding; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-removeleft"><?php echo $remove_padding_left; ?></label>
                        <div class="col-sm-10">
                            <select name="remove_left" id="input-removeleft" class="form-control">
                                <?php if ($remove_left) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-removeright"><?php echo $remove_padding_right; ?></label>
                        <div class="col-sm-10">
                            <select name="remove_right" id="input-removeright" class="form-control">
                                <?php if ($remove_right) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>