<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tag".
 *
 * @property int $id
 * @property string $image
 * @property string $canonical
 * @property int $sorted
 * @property int $tag_type
 *
 * @property ProductToTag[] $productToTags
 * @property TagType $tagType
 * @property TagName[] $tagNames
 */
class Tag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sorted', 'tag_type'], 'default', 'value' => null],
            [['sorted', 'tag_type'], 'integer'],
            [['image', 'canonical'], 'string', 'max' => 255],
            [['tag_type'], 'exist', 'skipOnError' => true, 'targetClass' => TagType::className(), 'targetAttribute' => ['tag_type' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'image' => Yii::t('app', 'Image'),
            'canonical' => Yii::t('app', 'Canonical'),
            'sorted' => Yii::t('app', 'Sorted'),
            'tag_type' => Yii::t('app', 'Tag Type'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToTags()
    {
        return $this->hasMany(ProductToTag::className(), ['tag_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagType()
    {
        return $this->hasOne(TagType::className(), ['id' => 'tag_type']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagNames()
    {
        return $this->hasMany(TagName::className(), ['tag_id' => 'id']);
    }
}
