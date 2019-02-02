<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Product;

/**
 * ProductSearch represents the model behind the search form of `app\models\Product`.
 */
class ProductSearch extends Product
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'brand_id', 'bloom_start', 'bloom_end', 'product_status_id', 'quantity', 'outstock_status_id'], 'integer'],
            [['canonical', 'image_src', 'harvest', 'genetics', 'height', 'created_at', 'sku', 'vendor_code'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Product::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'brand_id' => $this->brand_id,
            'bloom_start' => $this->bloom_start,
            'bloom_end' => $this->bloom_end,
            'created_at' => $this->created_at,
            'product_status_id' => $this->product_status_id,
            'quantity' => $this->quantity,
            'outstock_status_id' => $this->outstock_status_id,
        ]);

        $query->andFilterWhere(['ilike', 'canonical', $this->canonical])
            ->andFilterWhere(['ilike', 'image_src', $this->image_src])
            ->andFilterWhere(['ilike', 'harvest', $this->harvest])
            ->andFilterWhere(['ilike', 'genetics', $this->genetics])
            ->andFilterWhere(['ilike', 'height', $this->height])
            ->andFilterWhere(['ilike', 'sku', $this->sku])
            ->andFilterWhere(['ilike', 'vendor_code', $this->vendor_code]);

        return $dataProvider;
    }
}
