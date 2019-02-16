<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "promocode".
 *
 * @property int $id
 * @property string $promocode
 * @property string $date_start
 * @property string $date_end
 * @property int $quantity
 * @property int $discount_type_id
 *
 * @property ProductToPromocode[] $productToPromocodes
 * @property DiscountType $discountType
 */
class Promocode extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'promocode';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['date_start', 'date_end', 'discount_type_id'], 'required'],
            [['date_start', 'date_end'], 'safe'],
            [['quantity', 'discount_type_id'], 'default', 'value' => null],
            [['quantity', 'discount_type_id'], 'integer'],
            [['promocode'], 'string', 'max' => 255],
            [['discount_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => DiscountType::className(), 'targetAttribute' => ['discount_type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'promocode' => Yii::t('app', 'Promocode'),
            'date_start' => Yii::t('app', 'Date Start'),
            'date_end' => Yii::t('app', 'Date End'),
            'quantity' => Yii::t('app', 'Quantity'),
            'discount_type_id' => Yii::t('app', 'Discount Type ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToPromocodes()
    {
        return $this->hasMany(ProductToPromocode::className(), ['promocode_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountType()
    {
        return $this->hasOne(DiscountType::className(), ['id' => 'discount_type_id']);
    }
}
