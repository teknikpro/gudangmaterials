<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <td colspan="2">
                    <?php echo $text_shipping_details;?>
                </td>
            </tr>
        </thead>
        <tbody>
            
            
            <?php if($waybill && $waybill['status'] == 200) { ?>
        <tr>
            <td>
            <div id="shipment-profile">
                <tr>
                <td><?php echo $text_shipping_number; ?></td>
                <td><?php echo $waybill['profile']['waybill_number']; ?></td>
            </tr>
            <tr>
                <td><?php echo $text_date;?></td>
                <td><?php echo $waybill['profile']['waybill_date'];?></td>
            </tr>   

            <tr>
                <td><?php echo $text_courier;?></td>
                <td><?php echo $waybill['profile']['courier_name']; ?></td>
            </tr>

            <tr>
                <td><?php echo $text_service;?></td>
                <td><?php echo $waybill['profile']['service_code'];?></td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_origin;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['origin'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_weight;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['weight'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_destination;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['destination'];?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo $text_shipper_name;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['shippper_name'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_receiver_name;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['receiver_name'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_receiver_addr1;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['receiver_address1'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_receiver_addr2;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['receiver_address2'];?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php echo $text_receiver_addr3;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['receiver_address3'];?>
                </td>
            </tr>


            <tr>
                <td>
                    <?php echo $text_status;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['status'];?>
                </td>
            </tr>
            </div>

            </td>
            </tr>
            <tr>
                <td>
                    <?php echo $text_pod_receiver;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['pod_receiver'];?>
                </td>
            </tr>            

            <tr>
                <td>
                    <?php echo $text_pod_date;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['pod_date'];?>
                </td>
            </tr>               
            <tr>
                <td>
                    <?php echo $text_pod_time;?>
                </td>
                <td>
                    <?php echo $waybill['profile']['pod_time'];?>
                </td>
            </tr>
            <?php foreach ($waybill['manifest'] as $manifest => $item) { ?>
            <tr>
                <td><?php echo $text_manifest;?>
                    <?php echo $item['manifest_code'];?>
                </td>
                <td>
                    <?php echo $item['city_name'];?>
                    <?php echo $item['manifest_date'];?> -
                    <?php echo $item['manifest_time'];?> [
                    <?php echo $item['manifest_description'];?> ]
                </td>
            </tr>
            <?php } ?>

            <?php } elseif ($waybill && $waybill['status'] == 400) { ?>
            <tr>
                <td colspan="2" style="text-align:center;"><?php echo $waybill['message']; ?></td>
            </tr>
            <?php } else { ?>
            <tr>
                <td colspan="2" style="text-align:center;"><?php echo $text_no_shipping_receipt;?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>