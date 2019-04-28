<?php

namespace app\modules\admin\models\product\option;

use Yii;

/**
 * This is the model class for table "product_option_group_name".
 *
 * @property int $id
 * @property int $group_id
 * @property int $lang_id
 * @property string $content
 *
 * @property Lang $lang
 * @property ProductOptionGroup $group
 */
class ProductOptionGroupName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_option_group_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['group_id', 'lang_id'], 'default', 'value' => null],
            [['group_id', 'lang_id'], 'integer'],
            [['lang_id', 'content'], 'required'],
            [['content'], 'string'],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['group_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOptionGroup::className(), 'targetAttribute' => ['group_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'group_id' => Yii::t('app', 'Group ID'),
            'lang_id' => Yii::t('app', 'Lang ID'),
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
    public function getGroup()
    {
        return $this->hasOne(ProductOptionGroup::className(), ['id' => 'group_id']);
    }
}
