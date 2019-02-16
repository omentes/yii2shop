<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "tag_name".
 *
 * @property int $id
 * @property int $tag_id
 * @property string $name
 * @property int $lang_id
 * @property string $meta_title
 * @property string $meta_description
 * @property string $meta_keywords
 * @property string $meta_h1
 * @property string $content
 *
 * @property Lang $lang
 * @property Tag $tag
 */
class TagName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tag_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tag_id', 'lang_id'], 'default', 'value' => null],
            [['tag_id', 'lang_id'], 'integer'],
            [['content'], 'string'],
            [['name', 'meta_title', 'meta_description', 'meta_keywords', 'meta_h1'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['tag_id'], 'exist', 'skipOnError' => true, 'targetClass' => Tag::className(), 'targetAttribute' => ['tag_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tag_id' => Yii::t('app', 'Tag ID'),
            'name' => Yii::t('app', 'Name'),
            'lang_id' => Yii::t('app', 'Lang ID'),
            'meta_title' => Yii::t('app', 'Meta Title'),
            'meta_description' => Yii::t('app', 'Meta Description'),
            'meta_keywords' => Yii::t('app', 'Meta Keywords'),
            'meta_h1' => Yii::t('app', 'Meta H1'),
            'content' => Yii::t('app', 'Content'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLang()
    {
        return $this->hasOne(Lang::className(), ['id' => 'lang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTag()
    {
        return $this->hasOne(Tag::className(), ['id' => 'tag_id']);
    }
}
