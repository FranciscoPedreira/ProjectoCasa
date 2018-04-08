package pt.francisco.hibernate.model;

import java.io.Serializable;

/**
 * @author Francisco
 *
 */

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {
	
	String role;
	String address;
	String country;
	
	public Employee() {
		
	}
	
	@Embeddable
	public static class EmployeeId implements Serializable { 
		
		public static final long serialVersionUID = 1L;
		
		public EmployeeId(){}
	    
		@Column(name = "firstname")
	    private String firstName;

	    @Column(name = "lastname")
	    private String lastName;
	    
	    public EmployeeId(String firstName, String lastName) {
	    	this.firstName = firstName;
	    	this.lastName = lastName;
	    }
	    
	    public String getFirstName() {
	    	return firstName;
	    }
	    
	    public String getLastName() {
	    	return lastName;
	    }
	    
	}
	
	
	@EmbeddedId
	EmployeeId id;
	
	
	/**
	 * @return the role
	 */
	@Column(name = "role")
	public String getRole() {
		return role;
	}


	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}


	/**
	 * @return the address
	 */
	@Column(name = "address")
	public String getAddress() {
		return address;
	}


	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}


	/**
	 * @return the country
	 */
	@Column(name = "country")
	public String getCountry() {
		return country;
	}


	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}


	/**
	 * @return the id
	 */
	public EmployeeId getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(EmployeeId id) {
		this.id = id;
	}

	
	
	
	
}


