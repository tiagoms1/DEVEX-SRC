package obi1.fi.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import obi1.fi.business.entity.FiCdUsuarioUSUA;
import obi1.fi.common.exception.FiException;
import obi1.fi.common.util.Constantes;

@Repository
public final class DbConnectServiceImpl extends AbstractService implements DbConnectService {
	
	@Autowired
	private GenericService gService;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void checkDefaultRecords() {
		
		try {
			if (gService.getListALLEntity(new FiCdUsuarioUSUA()).size() == 0) {
				
				//USUARIO ADMINISTRADOR
				getEM().persist(new FiCdUsuarioUSUA(Constantes.ID_USER_ADM, "Administrador", "admin", "NHGNgMJAMnLJD"));
				
			}
		}
		catch (Exception e) {
			throw new FiException(e, "Erro ao tentar criar os registros base (" + e.getMessage() + ")");
		}
	}
}
