package com.dto;

public class FoodMenuDTO extends BaseBean {
	int id=3;
	String addDishName;
	long fId;
	long rId;
	String name;
	String veganNonVegan;
	String type;
	String rangeMax;
	String rangeMin;
	String type2;
	String price;
	String availability;
	String offerCode;
	String AddCompletelyNewDish;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddDishName() {
		return addDishName;
	}

	public void setAddDishName(String addDishName) {
		this.addDishName = addDishName;
	}

	public String getAddCompletelyNewDish() {
		return AddCompletelyNewDish;
	}

	public void setAddCompletelyNewDish(String addCompletelyNewDish) {
		AddCompletelyNewDish = addCompletelyNewDish;
	}

	public long getfId() {
		return fId;
	}

	public void setfId(long fId) {
		this.fId = fId;
	}

	public long getrId() {
		return rId;
	}

	public void setrId(long rId) {
		this.rId = rId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVeganNonVegan() {
		return veganNonVegan;
	}

	public void setVeganNonVegan(String veganNonVegan) {
		this.veganNonVegan = veganNonVegan;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRangeMax() {
		return rangeMax;
	}

	public void setRangeMax(String rangeMax) {
		this.rangeMax = rangeMax;
	}

	public String getRangeMin() {
		return rangeMin;
	}

	public void setRangeMin(String rangeMin) {
		this.rangeMin = rangeMin;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getOfferCode() {
		return offerCode;
	}

	public void setOfferCode(String offerCode) {
		this.offerCode = offerCode;
	}

	@Override
	public String getKey() {
		return availability + "";
	}

	@Override
	public String getValue() {
		return name;
	}

}
