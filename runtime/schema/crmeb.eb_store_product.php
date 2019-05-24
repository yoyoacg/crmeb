<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'mediumint(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => true,
  ),
  'mer_id' => 
  array (
    'name' => 'mer_id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'image' => 
  array (
    'name' => 'image',
    'type' => 'varchar(128)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'slider_image' => 
  array (
    'name' => 'slider_image',
    'type' => 'varchar(512)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'store_name' => 
  array (
    'name' => 'store_name',
    'type' => 'varchar(128)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'store_info' => 
  array (
    'name' => 'store_info',
    'type' => 'varchar(256)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'keyword' => 
  array (
    'name' => 'keyword',
    'type' => 'varchar(256)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'cate_id' => 
  array (
    'name' => 'cate_id',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'price' => 
  array (
    'name' => 'price',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'vip_price' => 
  array (
    'name' => 'vip_price',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'ot_price' => 
  array (
    'name' => 'ot_price',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'postage' => 
  array (
    'name' => 'postage',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'unit_name' => 
  array (
    'name' => 'unit_name',
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'sort' => 
  array (
    'name' => 'sort',
    'type' => 'smallint(11)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'sales' => 
  array (
    'name' => 'sales',
    'type' => 'mediumint(11) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'stock' => 
  array (
    'name' => 'stock',
    'type' => 'mediumint(11) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_show' => 
  array (
    'name' => 'is_show',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '1',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_hot' => 
  array (
    'name' => 'is_hot',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_benefit' => 
  array (
    'name' => 'is_benefit',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_best' => 
  array (
    'name' => 'is_best',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_new' => 
  array (
    'name' => 'is_new',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'description' => 
  array (
    'name' => 'description',
    'type' => 'text',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'add_time' => 
  array (
    'name' => 'add_time',
    'type' => 'int(11) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'is_postage' => 
  array (
    'name' => 'is_postage',
    'type' => 'tinyint(1) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_del' => 
  array (
    'name' => 'is_del',
    'type' => 'tinyint(1) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'mer_use' => 
  array (
    'name' => 'mer_use',
    'type' => 'tinyint(1) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'give_integral' => 
  array (
    'name' => 'give_integral',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'cost' => 
  array (
    'name' => 'cost',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'is_seckill' => 
  array (
    'name' => 'is_seckill',
    'type' => 'tinyint(1) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_bargain' => 
  array (
    'name' => 'is_bargain',
    'type' => 'tinyint(1) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'ficti' => 
  array (
    'name' => 'ficti',
    'type' => 'mediumint(11)',
    'notnull' => false,
    'default' => '100',
    'primary' => false,
    'autoinc' => false,
  ),
  'browse' => 
  array (
    'name' => 'browse',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'code_path' => 
  array (
    'name' => 'code_path',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
);