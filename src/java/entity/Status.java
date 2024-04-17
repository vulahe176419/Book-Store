/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public enum Status {
    PENDING(1, "Peding"),
    SHIPPING(2, "Shipping"),
    DELIVERED(3, "Delivered"),
    CANCELED(4, "Canceled"),;

    public final Integer code;
    public final String name;

    Status(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public static Status findByCode(Integer code) {
        for (Status value : values()) {
            if (value.code.equals(code)) {
                return value;
            }
        }
        return Status.CANCELED;
    }
}
