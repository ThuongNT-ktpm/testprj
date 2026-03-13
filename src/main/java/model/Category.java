/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LEGION
 */
public class Category {
    Integer CateId;
    String CateName;
    String CateDes;

    public Category() {
    }

  
    public Category(Integer CateId, String CateName, String CateDes) {
        this.CateId = CateId;
        this.CateName = CateName;
        this.CateDes = CateDes;
    }

    public Integer getCateId() {
        return CateId;
    }

    public void setCateId(Integer CateId) {
        this.CateId = CateId;
    }

    public String getCateName() {
        return CateName;
    }

    public void setCateName(String CateName) {
        this.CateName = CateName;
    }

    public String getCateDes() {
        return CateDes;
    }

    public void setCateDes(String CateDes) {
        this.CateDes = CateDes;
    }
    
    
}
