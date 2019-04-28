<?php

namespace app\modules\admin\models\product\option;

use Yii;

/**
 * This is the model class for table "product_option_group".
 *
 * @property int $id
 *
 * @property ProductOption[] $productOptions
 * @property ProductOption[] $productOptions0
 * @property ProductOptionGroupName[] $productOptionGroupNames
 */
class ProductOptionGroup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_option_group';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOptions()
    {
        return $this->hasMany(ProductOption::className(), ['option_group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOptions0()
    {
        return $this->hasMany(ProductOption::className(), ['option_group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOptionGroupNames()
    {
        return $this->hasMany(ProductOptionGroupName::className(), ['group_id' => 'id']);
    }
}
