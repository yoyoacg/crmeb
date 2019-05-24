<?php 
return array (
  'product_id' => 
  array (
    'name' => 'product_id',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'suk' => 
  array (
    'name' => 'suk',
    'type' => 'varchar(128)',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => false,
  ),
  'stock' => 
  array (
    'name' => 'stock',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'sales' => 
  array (
    'name' => 'sales',
    'type' => 'int(10) unsigned',
    'notnull' => false,
    'default' => '0',
    'primary' => false,
    'autoinc' => false,
  ),
  'price' => 
  array (
    'name' => 'price',
    'type' => 'decimal(8,2) unsigned',
    'notnull' => false,
    'default' => NULL,
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
  'unique' => 
  array (
    'name' => 'unique',
    'type' => 'char(8)',
    'notnull' => false,
    'default' => '',
    'primary' => true,
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
);