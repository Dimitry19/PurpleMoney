package cm.purplemoney.sanction.usr.action;

import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.sanction.ent.bo.SanctionBO;
import cm.purplemoney.sanction.ent.vo.SanctionVO;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("sanctionAction")
@Scope("prototype")
public class SanctionAction extends BaseAction implements SessionAware,Preparable {
    private static final Logger log = LoggerFactory.getLogger(SanctionAction.class);



    private static final long serialVersionUID = 1L;

    private MemberVO member;
    private SanctionVO sanctionAdd;
    private List members;
    private List sanctions;
    private AssociationVO associationCurrent;
    private String term;
    private List<MemberVO> membersNames;
    private List associations;

    @Resource(name="authUserBO")
    private AuthUserBO authUserBO;

    @Resource(name="memberBO")
    private MemberBO memberBO;

    @Resource(name = "associationBO")
    private AssociationBO associationBO;

    @Resource(name = "roleBO")
    private RoleBO roleBO;

    @Resource(name="sanctionBO")
    private SanctionBO sanctionBO;

    @Override
    public void prepare() throws Exception {

        associations=associationBO.loadAllAssociations();

    }

    public String execute() {

        if (log.isDebugEnabled()){
            debugMessageCall();
        }return SUCCESS;
    }
    public String addSanction() throws Exception{

        if (log.isDebugEnabled()){
            debugMessageCall();
        }
        sanctionBO.addSanction(sanctionAdd);
        loadWidgetInfo(true);
        return SUCCESS;
    }
    public String allSanctions()  throws Exception{

        if (log.isDebugEnabled()){
            debugMessageCall();
        }
        sanctions=sanctionBO.allSanctions(currentAssociation.toUpperCase());
        return SUCCESS;
    }
    public String findSanctionByUser() throws Exception{

        return SUCCESS;
    }

    public String autocomplete() throws Exception{

        if(StringUtils.isNotBlank(term)){
            membersNames = memberBO.autocomplete(term,currentAssociation.toUpperCase());
        }
        return SUCCESS;
    }

    public MemberVO getMember() {
        return member;
    }

    public void setMember(MemberVO member) {
        this.member = member;
    }

    public List getMembers() {
        return members;
    }

    public void setMembers(List members) {
        this.members = members;
    }

    public List getSanctions() {
        return sanctions;
    }

    public void setSanctions(List sanctions) {
        this.sanctions = sanctions;
    }

    public AssociationVO getAssociationCurrent() {
        return associationCurrent;
    }

    public void setAssociationCurrent(AssociationVO associationCurrent) {
        this.associationCurrent = associationCurrent;
    }


    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public List<MemberVO>  getMembersNames() {
        return membersNames;
    }

    public void setMembersNames(List<MemberVO>  membersNames) {
        this.membersNames = membersNames;
    }

    public List getAssociations() {
        return associations;
    }

    public void setAssociations(List associations) {
        this.associations = associations;
    }

    public SanctionVO getSanctionAdd() {
        return sanctionAdd;
    }

    public void setSanctionAdd(SanctionVO sanctionAdd) {
        this.sanctionAdd = sanctionAdd;
    }
}
