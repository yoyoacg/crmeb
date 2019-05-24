<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => true,
  ),
  'uid' => 
  array (
    'name' => 'uid',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'oid' => 
  array (
    'name' => 'oid',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'unique' => 
  array (
    'name' => 'unique',
    'type' => 'char(32)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'product_id' => 
  array (
    'name' => 'product_id',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'reply_type' => 
  array (
    'name' => 'reply_type',
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => 'product',
    'primary' => false,
    'autoinc' => false,
  ),
  'product_score' => 
  array (
    'name' => 'product_score',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'service_score' => 
  array (
    'name' => 'service_score',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'comment' => 
  array (
    'name' => 'comment',
    'type' => 'varchar(512)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'pics' => 
  array (
    'name' => 'pics',
    'type' => 'text',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'add_time' => 
  array (
    'name' => 'add_time',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'merchant_reply_content' => 
  array (
    'name' => 'merchant_reply_content',
    'type' => 'varchar(300)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'merchant_reply_time' => 
  array (
    'name' => 'merchant_reply_time',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
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
  'is_reply' => 
  array (
    'name' => 'is_reply',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
);