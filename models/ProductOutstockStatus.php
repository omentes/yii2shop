<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_outstock_status".
 *
 * @property int $id
 *
 * @property Product[] $products
 * @property ProductOutstockStatusName[] $productOutstockStatusNames
 */
class ProductOutstockStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_outstock_status';
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
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['outstock_status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOutstockStatusNames()
    {
        return $this->hasMany(ProductOutstockStatusName::className(), ['product_outstock_status_id' => 'id']);
    }
}
