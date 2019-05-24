<?php 
return array (
  'oid' => 
  array (
    'name' => 'oid',
    'type' => 'int(11) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => false,
  ),
  'cart_id' => 
  array (
    'name' => 'cart_id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'product_id' => 
  array (
    'name' => 'product_id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'cart_info' => 
  array (
    'name' => 'cart_info',
    'type' => 'text',
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
    'primary' => true,
    'autoinc' => false,
  ),
);