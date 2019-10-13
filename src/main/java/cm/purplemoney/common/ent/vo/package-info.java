/*
@TypeDefs({
		@TypeDef(name = "printer_type_enum", typeClass = com.grupposinapsi.jpcore.persistence.hibernate.types.GenericEnumUserType.class, parameters = { @org.hibernate.annotations.Parameter(name = "enumClass", value = "it.fracm.dal.production.ent.vo.enums.PrinterTypeEnum") }),
		@TypeDef(name = "activity_status_enum", typeClass = com.grupposinapsi.jpcore.persistence.hibernate.types.GenericEnumUserType.class, parameters = { @org.hibernate.annotations.Parameter(name = "enumClass", value = "it.fracm.dal.production.ent.vo.enums.ActivityStatusEnum") }),
		@TypeDef(name = "activity_dep_status_enum", typeClass = com.grupposinapsi.jpcore.persistence.hibernate.types.GenericEnumUserType.class, parameters = { @org.hibernate.annotations.Parameter(name = "enumClass", value = "it.fracm.dal.production.ent.vo.enums.ActivityDepStatusEnum") }),
		@TypeDef(name = "authorization_enum", typeClass = com.grupposinapsi.jpcore.persistence.hibernate.types.GenericEnumUserType.class, parameters = { @org.hibernate.annotations.Parameter(name = "enumClass", value = "it.fracm.dal.profile.ent.vo.enums.Authorization") }),
		@TypeDef(name = "status_enum", typeClass = com.grupposinapsi.jpcore.persistence.hibernate.types.GenericEnumUserType.class, parameters = { @org.hibernate.annotations.Parameter(name = "enumClass", value = "it.fracm.dal.common.ent.vo.StatusEnum") }),
		
})
*/

@org.hibernate.annotations.FilterDefs({
		@org.hibernate.annotations.FilterDef (name= FilterConstants.ACTIVE_MBR        ,defaultCondition="ACTIVE=:act"      ,parameters={@org.hibernate.annotations.ParamDef(name=FilterConstants.ACTIVE_MBR_PRM        ,type="boolean")}),
		@org.hibernate.annotations.FilterDef (name= FilterConstants.ASSOCIATION    ,defaultCondition="R_ASSOCIATION=:assoc"    ,parameters={@org.hibernate.annotations.ParamDef(name=FilterConstants.ASSOCIATION_PRM    ,type="string")}),
})

package cm.purplemoney.common.ent.vo;

import cm.purplemoney.constants.FilterConstants;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;
