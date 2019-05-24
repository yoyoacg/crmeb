<?php 
return array (
  'uid' => 
  array (
    'name' => 'uid',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => false,
  ),
  'product_id' => 
  array (
    'name' => 'product_id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => false,
  ),
  'type' => 
  array (
    'name' => 'type',
    'type' => 'varchar(32)',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => false,
  ),
  'category' => 
  array (
    'name' => 'category',
    'type' => 'varchar(32)',
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
);