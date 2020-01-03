<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class user_app extends Model
{
    protected $fillable = [
      'name', 'surname', 'nickname', 'birthday', 'gender', 'tel', 'evaluated_id'
    ];
}
