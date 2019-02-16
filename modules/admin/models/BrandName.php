<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "brand_name".
 *
 * @property int $id
 * @property int $brand_id
 * @property string $name
 * @property int $lang_id
 * @property string $meta_title
 * @property string $meta_description
 * @property string $meta_keywords
 * @property string $meta_h1
 * @property string $content
 * @property string $country
 *
 * @property Brand $brand
 * @property Lang $lang
 */
class BrandName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'brand_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['brand_id', 'lang_id'], 'default', 'value' => null],
            [['brand_id', 'lang_id'], 'integer'],
            [['content'], 'string'],
            [['name', 'meta_title', 'meta_description', 'meta_keywords', 'meta_h1', 'country'], 'string', 'max' => 255],
            [['brand_id'], 'exist', 'skipOnError' => true, 'targetClass' => Brand::className(), 'targetAttribute' => ['brand_id' => 'id']],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'brand_id' => Yii::t('app', 'Brand ID'),
            'name' => Yii::t('app', 'Name'),
            'lang_id' => Yii::t('app', 'Lang ID'),
            'meta_title' => Yii::t('app', 'Meta Title'),
            'meta_description' => Yii::t('app', 'Meta Description'),
            'meta_keywords' => Yii::t('app', 'Meta Keywords'),
            'meta_h1' => Yii::t('app', 'Meta H1'),
            'content' => Yii::t('app', 'Content'),
            'country' => Yii::t('app', 'Country'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBrand()
    {
        return $this->hasOne(Brand::className(), ['id' => 'brand_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLang()
    {
        return $this->hasOne(Lang::className(), ['id' => 'lang_id']);
    }
}
