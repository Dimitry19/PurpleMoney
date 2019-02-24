package cm.purplemoney.members.ent.vo;

import cm.purplemoney.session.ent.vo.SessionVO;

import javax.persistence.*;
import java.math.BigInteger;


@Entity
@Table(name="RECEIVER" , schema="PUBLIC")
public class ReceiverVO extends MemberVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7113228696088349695L;

	private SessionVO amount;
	private BigInteger montantTotale;
	

}
