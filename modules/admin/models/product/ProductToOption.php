<?php

namespace app\modules\admin\models\product;

use Yii;

/**
 * This is the model class for table "product_to_option".
 *
 * @property int $id
 * @property int $product_id
 * @property int $option_id
 *
 * @property Product $product
 * @property ProductOption $option
 */
class ProductToOption extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_to_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'option_id'], 'default', 'value' => null],
            [['product_id', 'option_id'], 'integer'],
            [['product_id'], 'exist', 'skipOnError' => true, 'targetClass' => Product::className(), 'targetAttribute' => ['product_id' => 'id']],
            [['option_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOption::className(), 'targetAttribute' => ['option_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'product_id' => Yii::t('app', 'Product ID'),
            'option_id' => Yii::t('app', 'Option ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOption()
    {
        return $this->hasOne(ProductOption::className(), ['id' => 'option_id']);
    }
}
