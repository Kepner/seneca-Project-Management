package seneca.projectManagement.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.3.0.v20110604-r9504", date="2012-04-16T11:27:03")
@StaticMetamodel(Comments.class)
public class Comments_ { 

    public static volatile SingularAttribute<Comments, String> commentDescription;
    public static volatile SingularAttribute<Comments, Integer> commentStatus;
    public static volatile SingularAttribute<Comments, Integer> projectId;
    public static volatile SingularAttribute<Comments, Integer> commentId;

}