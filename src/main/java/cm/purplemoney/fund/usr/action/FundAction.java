package cm.purplemoney.fund.usr.action;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.fund.ent.bo.FundBO;
import cm.purplemoney.fund.ent.vo.FundVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

@Component("fundAction")
@Scope("prototype")
public class FundAction extends BaseAction implements Preparable {


	private static final Logger log = LoggerFactory.getLogger(FundAction.class);
	private List funds;
	private FundVO fund;
	private AssociationVO associationCurrent;

	@Resource(name = "associationBO")
	private AssociationBO associationBO;

	@Resource(name="fundBO")
	private FundBO fundBO;






	@Override
	public void prepare() throws Exception {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}

		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());

	}

	public String execute() throws BusinessException {

		if (log.isDebugEnabled()){
			debugMessageCall();

		}
		loadWidgetInfo(true);
		return SUCCESS;
	}

	public void validate(){
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		if(fund!=null) {
			showNotification=false;
			if (StringUtils.isEmpty(fund.getId().getMmember().getId().getName())) {
				addActionError(getText("session.add.member.error"));
			}
			if (fund.getDate()==null){
				addActionError(getText("session.add.data.error"));
			}
		}
	}
	public String funds() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		funds=fundBO.funds();
		return SUCCESS;
	}

	public String addFund() throws BusinessException {

		// TODO Controller pourquoi ca ne passe par ici
		if(fundBO.addFund(fund)){
			addActionMessage(getText("loan.add.success"));

		}else{
			addActionError(getText("loan.add.error"));
		}

		return SUCCESS;
	}


	public List getFunds() {
		return funds;
	}

	public void setFunds(List funds) {
		this.funds = funds;
	}

	public FundVO getFund() {

		return fund;
	}

	public void setFund(FundVO fund) {

		this.fund = fund;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}
}
