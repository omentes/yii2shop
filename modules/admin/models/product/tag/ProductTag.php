<?php

namespace app\modules\admin\models\product\tag;

use Yii;

/**
 * This is the model class for table "product_tag".
 *
 * @property int $id
 * @property string $image
 * @property int $sorted
 * @property int $tag_type
 *
 * @property ProductTagType $tagType
 * @property ProductTagName[] $productTagNames
 * @property ProductToTag[] $productToTags
 */
class ProductTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sorted', 'tag_type'], 'default', 'value' => null],
            [['sorted', 'tag_type'], 'integer'],
            [['image'], 'string', 'max' => 255],
            [['tag_type'], 'exist', 'skipOnError' => true, 'targetClass' => ProductTagType::className(), 'targetAttribute' => ['tag_type' => 'id']],
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
            'sorted' => Yii::t('app', 'Sorted'),
            'tag_type' => Yii::t('app', 'Tag Type'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagType()
    {
        return $this->hasOne(ProductTagType::className(), ['id' => 'tag_type']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductTagNames()
    {
        return $this->hasMany(ProductTagName::className(), ['tag_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToTags()
    {
        return $this->hasMany(ProductToTag::className(), ['tag_id' => 'id']);
    }
}
