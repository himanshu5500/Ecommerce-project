package com.myshoppro.myshopprobackend.dao;

import java.util.List;

import com.myshoppro.myshopprobackend.model.Supplier;

public interface SupplierDAO {
	public void insertOrUpdateSupplier(Supplier supplier);
	public Supplier getSupplier(int sup_id);
	public List<Supplier> getSupplierDetails();
	public void deleteSupplier(Supplier supplier);
	
}
