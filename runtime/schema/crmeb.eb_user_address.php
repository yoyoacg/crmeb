<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'mediumint(8) unsigned',
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
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'phone' => 
  array (
    'name' => 'phone',
    'type' => 'varchar(16)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'province' => 
  array (
    'name' => 'province',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'city' => 
  array (
    'name' => 'city',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'district' => 
  array (
    'name' => 'district',
    'type' => 'varchar(64)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'detail' => 
  array (
    'name' => 'detail',
    'type' => 'varchar(256)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'post_code' => 
  array (
    'name' => 'post_code',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'longitude' => 
  array (
    'name' => 'longitude',
    'type' => 'varchar(16)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'latitude' => 
  array (
    'name' => 'latitude',
    'type' => 'varchar(16)',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_default' => 
  array (
    'name' => 'is_default',
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
  'add_time' => 
  array (
    'name' => 'add_time',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
);