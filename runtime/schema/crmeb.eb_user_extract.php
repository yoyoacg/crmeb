<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => true,
  ),
  'uid' => 
  array (
    'name' => 'uid',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'real_name' => 
  array (
    'name' => 'real_name',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'extract_type' => 
  array (
    'name' => 'extract_type',
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => 'bank',
    'primary' => false,
    'autoinc' => false,
  ),
  'bank_code' => 
  array (
    'name' => 'bank_code',
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'bank_address' => 
  array (
    'name' => 'bank_address',
    'type' => 'varchar(256)',
    'notnull' => false,
    'default' => '',
    'primary' => false,
    'autoinc' => false,
  ),
  'alipay_code' => 
  array (
    'name' => 'alipay_code',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => '',
    'primary' => false,
    'autoinc' => false,
  ),
  'extract_price' => 
  array (
    'name' => 'extract_price',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'mark' => 
  array (
    'name' => 'mark',
    'type' => 'varchar(512)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'balance' => 
  array (
    'name' => 'balance',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => '0.00',
    'primary' => false,
    'autoinc' => false,
  ),
  'fail_msg' => 
  array (
    'name' => 'fail_msg',
    'type' => 'varchar(128)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'fail_time' => 
  array (
    'name' => 'fail_time',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'add_time' => 
  array (
    'name' => 'add_time',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'status' => 
  array (
    'name' => 'status',
    'type' => 'tinyint(2)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'wechat' => 
  array (
    'name' => 'wechat',
    'type' => 'varchar(15)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
);