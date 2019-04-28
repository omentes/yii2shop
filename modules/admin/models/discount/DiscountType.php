<?php

namespace app\modules\admin\models\discount;

use app\modules\admin\models\Promocode;
use Yii;

/**
 * This is the model class for table "discount_type".
 *
 * @property int $id
 * @property string $name
 * @property int $discount_logic_type
 * @property int $how
 *
 * @property DiscountPlan[] $discountPlans
 * @property DiscountLogic $discountLogicType
 * @property Promocode[] $promocodes
 */
class DiscountType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'discount_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'discount_logic_type', 'how'], 'required'],
            [['discount_logic_type', 'how'], 'default', 'value' => null],
            [['discount_logic_type', 'how'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['discount_logic_type'], 'exist', 'skipOnError' => true, 'targetClass' => DiscountLogic::className(), 'targetAttribute' => ['discount_logic_type' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'discount_logic_type' => Yii::t('app', 'Discount Logic Type'),
            'how' => Yii::t('app', 'How'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountPlans()
    {
        return $this->hasMany(DiscountPlan::className(), ['discount_type_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountLogicType()
    {
        return $this->hasOne(DiscountLogic::className(), ['id' => 'discount_logic_type']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPromocodes()
    {
        return $this->hasMany(Promocode::className(), ['discount_type_id' => 'id']);
    }
}
