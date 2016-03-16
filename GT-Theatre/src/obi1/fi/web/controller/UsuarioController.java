package obi1.fi.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import obi1.fi.business.entity.FiCdUsuarioUSUA;
import obi1.fi.business.service.GenericService;
import obi1.fi.business.service.UsuarioService;
import obi1.fi.business.to.UsuarioTO;
import obi1.fi.common.exception.FiException;
import obi1.fi.common.util.Encrypt;

/**
 * Controller para a funcionalidade de cadastro de usuários.
 *
 */
@Controller
@RequestMapping("Usuario")
@Scope("request")
public final class UsuarioController extends AbstractController {

	@Autowired
	private GenericService service;

	@Autowired
	private UsuarioService usuarioService;

	private UsuarioTO usuarioTO;
	
	/**
	 * Construtor padrão do controller.
	 */
	public UsuarioController() {
		usuarioTO = new UsuarioTO();
	}
	
	/**
	 * Abre a tela com a relação com os usuarios cadastrados.
	 * @return modelAndView da tela de lista
	 */
	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("tiles.adm.usuario.list");
		
		model.addObject("usuarioTO", usuarioTO);
		return model;
	}

	/**
	 * Retorna o resulttable com o resultado da pesquisa.
	 * @param usuarioTO to com os filtros preenchidos
	 * @return Json com o resulttable com o resultado da pesquisa
	 */
	@RequestMapping("retrieve")
	@ResponseBody
	public String retrieve(UsuarioTO usuarioTO) {
		try {
			usuarioService.fillDataQueryBaseTO(usuarioTO);
		}
		catch (Exception x) {
			throw new FiException(x);
		}

		return getJsonResultTable(usuarioTO);
	}

	/**
	 * Abre a tela de edição do usuario.
	 * @param usuarioTO TO de usuario
	 * @return tela de edição
	 */
	@RequestMapping("edit")
	public String edit(UsuarioTO usuarioTO) {
		usuarioService.fillTO(usuarioTO);
		
		return "tiles.adm.usuario.edit";
	}

	/**
	 * Salva senha do usuario.
	 * @param request request
	 * @param response response.
	 * @param usuarioTO usuarioTO
	 * @return pagina de alteração de senha
	 */
	@RequestMapping("savepwd")
	@ResponseBody
	public String savePwd(HttpServletRequest request, HttpServletResponse response, UsuarioTO usuarioTO) {
		try {
			usuarioTO.getEntity().setUsuaDsPwd(Encrypt.encrypt(usuarioTO.getEntity().getUsuaDsLogin(), usuarioTO.getEntity().getUsuaDsPwd()));
			usuarioService.save(usuarioTO);
			
			setMessageSuccess(request, "Senha alterada com sucesso!");
		}
		catch (Exception x) {
			throw new FiException(x, "Erro salvando ao alterar senha");
		}
		//changePwd(request)
		return getJsonSuccess("system.message.senha.success");
	}
	
	/**
	 * Salva o usuário.
	 * @param usuarioTO usuarioTO
	 * @param request request
	 * @return lista de usuarios cadastrados
	 */
	@RequestMapping("save")
	@ResponseBody
	public String save(HttpServletRequest request, UsuarioTO usuarioTO) {
		String result = getJsonSuccess("system.message.success");
		
		try {
			usuarioTO.getEntity().setUsuaDsPwd(Encrypt.encrypt(usuarioTO.getEntity().getUsuaDsLogin(), usuarioTO.getEntity().getUsuaDsPwd()));
			usuarioService.save(usuarioTO);
		}
		catch (DataIntegrityViolationException x) {
			result = getJsonError("usuarios.message.loginOuEmailDuplicado");
		}
		catch (Exception x) {
			throw new FiException(x);
		}
		
		return result;
	}

	/**
	 * Deleta um usuário.
	 * @param request request 
	 * @param usuarioTO usuarioTO
	 * @return String mensagem de sucesso ou falha
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(HttpServletRequest request, UsuarioTO usuarioTO) {
		try {
			service.delete(usuarioTO);
		} 
		catch (DataIntegrityViolationException x) {
			throw new FiException("Este registro não pode ser excluído pois está sendo utilizado.");
		}
		catch (Exception x) {
			throw new FiException(x);
		}

		return getJsonSuccess("system.message.success");
	}
	
	/**
	 * Acessa pagina de alteração de senha do usuarioTO.
	 * @param request request
	 * @return pagina de alteração de senha
	 */
	@RequestMapping("changepwd")
	public String changePwd(HttpServletRequest request) {
		usuarioTO.setEntity((FiCdUsuarioUSUA) request.getSession().getAttribute("FiCdUsuarioUSUA"));
		return "tiles.adm.usuario.changepwd";
	}
	
	/**
	 * Retorna o model do controller.
	 * @return model
	 */
	@ModelAttribute("usuarioTO")
	public UsuarioTO getUsuarioTO() {		
		return usuarioTO;
	}

}
