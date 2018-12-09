<?php

use dmstr\web\AdminLteAsset;

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'language' => 'ru-RU',
    'defaultRoute' => '/',
    'sourceLanguage' => 'ru', // использовать в качестве ключей переводов
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'modules' => [
        'admin' => [
            'class' => 'app\modules\admin\Module',
            'layout' => 'main',
        ],
        'languages' => [
            'class' => 'klisl\languages\Module',
            //Языки используемые в приложении
            'languages' => [
                'English' => 'en',
                'Русский' => 'ru',
                'Українська' => 'uk',
            ],
            'default_language' => 'ru', //основной язык (по-умолчанию)
            'show_default' => false, //true - показывать в URL основной язык, false - нет
        ],
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'erL87TOAAvzQZvEf8v3sGgg4I6ikiQME',
            'baseUrl' => '',
            'class' => 'klisl\languages\Request'

        ],
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-purple',
                ],
            ],
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'enableStrictParsing' => true,
            'class' => 'klisl\languages\UrlManager',
            'rules' => [
//                '/admin/test' => 'admin/default/index',
                '/admin/<action>' => 'admin/default/<action>',
                '/admin' => 'admin/default/index',
                'languages' => 'languages/default/index', //для модуля мультиязычности
                //далее создаем обычные правила
//                'category/<slug:\w+>' => 'category/view',
                '<action:(index|about|contact|login|)>' => '/site/<action>',
                '<controller>/<action>' => '<controller>/<action>',
            ],
        ],
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'generators' => [ // HERE
            'crud' => [
                'class' => 'yii\gii\generators\crud\Generator',
                'templates' => [
                    'custom' => '@vendor/dmstr/yii2-adminlte-asset/gii/templates/crud/simple/views',
                ]
            ]
        ],
        // uncomment the following to add your IP if you are not connecting from localhost.
        'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
