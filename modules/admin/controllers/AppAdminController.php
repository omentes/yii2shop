<?php
/**
 * Created by PhpStorm.
 * User: omentes
 * Date: 12/9/18
 * Time: 2:16 PM
 */

namespace app\modules\admin\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;


class AppAdminController extends Controller{

    /**
     * @return array
     */
    public function behaviors(){
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }
}
