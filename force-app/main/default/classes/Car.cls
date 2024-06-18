public class Car extends Vehicle {
	// A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
    private Integer SteeringRotation {
        get{return (math.abs(SteeringRotation) > 1440) ? 1440 * (Integer)math.signum(SteeringRotation) : SteeringRotation;}
        set{SteeringRotation = value;}
    }
	public override void Turn(){}
}