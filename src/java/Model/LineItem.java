/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Objects;

/**
 *
 * @author Adisorn
 */
public class LineItem {
     private Product product;
    private int unit = 1;
    private double total = 0;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public double getTotal() {
        return  unit*(product.getPrice());
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.product);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final LineItem other = (LineItem) obj;
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        return true;
    }

    public LineItem(Product product) {
        this.product = product;
    }

    
    @Override
    public String toString() {
        return "LineItem{" + "product=" + product + ", unit=" + unit + ", total=" + total + '}';
    }
    
    
   
}
