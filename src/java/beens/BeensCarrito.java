/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beens;

/**
 *
 * @author varga
 */
public class BeensCarrito {
    int item;
    int id_producto;
    String nombre;
    String descrip;
    double PrecioFinal;
    int cantidad;
    double subToatal;

    public BeensCarrito() {
    }

    public BeensCarrito(int item, int id_producto, String nombre, String descrip, double PrecioFinal, int cantidad, double subToatal) {
        this.item = item;
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descrip = descrip;
        this.PrecioFinal = PrecioFinal;
        this.cantidad = cantidad;
        this.subToatal = subToatal;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public double getPrecioFinal() {
        return PrecioFinal;
    }

    public void setPrecioFinal(double PrecioFinal) {
        this.PrecioFinal = PrecioFinal;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubToatal() {
        return subToatal;
    }

    public void setSubToatal(double subToatal) {
        this.subToatal = subToatal;
    }
    
}
