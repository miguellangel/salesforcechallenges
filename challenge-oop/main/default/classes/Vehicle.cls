public abstract class Vehicle {
    // An enum publicly available called Medium with the values LAND, AIR, WATER
    public enum Medium {
        LAND,
		AIR,
		WATER
    }
    // A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
    public Integer Speed {
        get { return math.abs(Speed); }
        private set { Speed = value;}
    }
    
    // A property called Name. This should be read-only outside of the class
    public String Name {get;private set;}
    
    //A property called Occupants. This is not allowed to be negative
    private Integer Occupants {
        get {return math.abs(Occupants);}
        set {Occupants = value;}
    }
    
    // A constant called Capacity. This must be at least 1
   	final Integer Capacity;
    
    // A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children
	private List<Medium> Media = new List<Medium>();
    
    // A constructor that sets Speed, Occupants, Name, and Capacity to default values
    public Vehicle() {
        this.Name = '';
        this.Capacity = 1;
        this.Occupants = 0;
        this.Speed = 0;
    }
    
    // A method called Accelerate which changes Speed by the specified amount
    public void Accelerate(Integer accelerationAmount) {
        this.Speed += accelerationAmount;
    }
    // An abstract method called Turn
    public abstract void Turn();
    
    // A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants
    public String tooString() {
        String template = 'Speed: {0}\nMediums: {1}\nName: {2}\nOccupants: {3}';
        String[] values = new String[]{this.Speed.ToString(), this.Media.ToString(), this.Name, this.Occupants.ToString()};
            
        return String.format(template, values);
    }
    
}