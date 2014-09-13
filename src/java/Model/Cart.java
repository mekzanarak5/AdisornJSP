/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adisorn
 */
public class Cart {
    private Map<Integer, LineItem> items; //use Map because use key(Integer) for search
    public Cart(){
        items = new TreeMap<Integer, LineItem>();
    }
    public void add(LineItem li){
        LineItem tmp = items.get(li.getProduct().getProductno());
        if(tmp==null)
            items.put(li.getProduct().getProductno(), li);
        else
            tmp.setUnit(li.getUnit() + tmp.getUnit());
    }
    
    public List<LineItem> getLineItems(){
        List<LineItem> lines = new ArrayList<LineItem>(items.values());
        return lines;
    }
    
    public void remove(int productId){
        LineItem tmp = items.get(productId);
        if(tmp!=null)
            items.remove(productId);
    }
    
    public double getTotal(){
        double total = 0;
        List<LineItem> items = getLineItems();
        for(LineItem lt : items){
            total = total + lt.getUnit()*(lt.getProduct().getPrice());
        }
        return total;
    }
    
    public int getUnitItem(){
        return items.size();
    }

    
}
