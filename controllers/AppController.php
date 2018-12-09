<?php
/**
 * Created by PhpStorm.
 * User: omentes
 * Date: 12/9/18
 * Time: 10:23 AM
 */

namespace app\controllers;

use yii\web\Controller;

class AppController extends Controller{

    /**
     * Setup seo-tags on page
     *
     * @param null $title
     * @param null $keywords
     * @param null $description
     */
    protected function setMeta($title = null, $keywords = null, $description = null) {
        $this->view->title = $title;
        $this->view->registerMetaTag(['name' => 'keywords', 'content' => "$keywords"]);
        $this->view->registerMetaTag(['name' => 'description', 'content' => "$description"]);
    }
}
