<?php

namespace app\models\user;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property string $phone
 * @property string $email
 * @property int $type_id
 * @property string $password_hash
 * @property string $created_at
 * @property string $auth_key
 * @property string $access_token
 * @property string $updated_at
 * @property string $email_confirm_token
 * @property string $password_reset_token
 * @property int $status
 * @property string $username
 *
 * @property Order[] $orders
 * @property OrderMessage[] $orderMessages
 * @property OrderMessage[] $orderMessages0
 * @property UserType $type
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type_id', 'status'], 'default', 'value' => null],
            [['type_id', 'status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['username'], 'required'],
            [['phone'], 'string', 'max' => 20],
            [['email', 'email_confirm_token', 'password_reset_token', 'username'], 'string', 'max' => 255],
            [['password_hash', 'auth_key', 'access_token'], 'string', 'max' => 128],
            [['type_id'], 'exist', 'skipOnError' => true, 'targetClass' => UserType::className(), 'targetAttribute' => ['type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'phone' => Yii::t('app', 'Phone'),
            'email' => Yii::t('app', 'Email'),
            'type_id' => Yii::t('app', 'Type ID'),
            'password_hash' => Yii::t('app', 'Password Hash'),
            'created_at' => Yii::t('app', 'Created At'),
            'auth_key' => Yii::t('app', 'Auth Key'),
            'access_token' => Yii::t('app', 'Access Token'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'email_confirm_token' => Yii::t('app', 'Email Confirm Token'),
            'password_reset_token' => Yii::t('app', 'Password Reset Token'),
            'status' => Yii::t('app', 'Status'),
            'username' => Yii::t('app', 'Username'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Order::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderMessages()
    {
        return $this->hasMany(OrderMessage::className(), ['from_user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderMessages0()
    {
        return $this->hasMany(OrderMessage::className(), ['to_user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getType()
    {
        return $this->hasOne(UserType::className(), ['id' => 'type_id']);
    }
}
