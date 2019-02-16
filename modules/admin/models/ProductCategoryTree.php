<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "product_category_tree".
 *
 * @property int $id
 * @property int $child_id
 * @property int $parent_id
 * @property int $level
 *
 * @property ProductCategory $child
 * @property ProductCategory $parent
 */
class ProductCategoryTree extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_category_tree';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['child_id', 'parent_id', 'level'], 'default', 'value' => null],
            [['child_id', 'parent_id', 'level'], 'integer'],
            [['child_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductCategory::className(), 'targetAttribute' => ['child_id' => 'id']],
            [['parent_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductCategory::className(), 'targetAttribute' => ['parent_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'child_id' => Yii::t('app', 'Child ID'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'level' => Yii::t('app', 'Level'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getChild()
    {
        return $this->hasOne(ProductCategory::className(), ['id' => 'child_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(ProductCategory::className(), ['id' => 'parent_id']);
    }
}
