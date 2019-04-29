<?php

namespace app\modules\admin\controllers;

use Yii;
use yii\base\Model;
use \yii\db\Expression;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\product\category\ProductCategory;

/**
 * ProductCategorySearch represents the model behind the search form of `app\modules\admin\models\product\category\ProductCategory`.
 */
class ProductCategorySearch extends ProductCategory
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'sorted'], 'integer'],
            [['image', 'name', 'parent'], 'safe'],
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
        $query = ProductCategory::find()
            ->select([
                'product_category.*',
                'current.name',
                'parent_table.name as parent',
                'lang.name AS lang',
                ])
            ->innerJoin('product_category_name AS current', 'current.product_category_id = product_category.id')
            ->leftJoin('product_category_name AS parent_table', 'product_category.parent_id = parent_table.id')
            ->leftJoin('lang', 'lang.id = current.lang_id')
            ->where(['lang.name' => Yii::$app->language]);
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        $dataProvider->sort->attributes['name'] = [
            'asc' => ['current.name' => SORT_ASC],
            'desc' => ['current.name' => SORT_DESC],
        ];
        $dataProvider->sort->attributes['parent'] = [
            'asc' => ['parent_table.name' => SORT_ASC],
            'desc' => ['parent_table.name' => SORT_DESC],
        ];
        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $expName = new Expression('(current.name::text)');
        $expParent = new Expression('(parent_table.name::text)');
        $expSorted = new Expression('(sorted::text)');
        $query->andFilterWhere(['ilike', $expName, $this->name])
            ->andFilterWhere(['ilike', $expParent, $this->parent])
            ->andFilterWhere(['ilike', $expSorted, $this->sorted])
        ;

        return $dataProvider;
    }
}
