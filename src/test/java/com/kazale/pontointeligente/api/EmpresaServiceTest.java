package com.kazale.pontointeligente.api;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Optional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import com.kazale.pontointeligente.api.entities.Empresa;
import com.kazale.pontointeligente.api.repositories.EmpresaRepository;
import com.kazale.pontointeligente.api.services.EmpresaService;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("test")
public class EmpresaServiceTest {
	
	@MockBean
	private EmpresaRepository empresaRepository;
	
	@Autowired
	private EmpresaService empresaService;
	
	private static final String CNPJ = "34923078847";
	
	@Before
	public void setUp() throws Exception{
		BDDMockito.given(this.empresaRepository.findByCnpj(Mockito.anyString())).willReturn(new Empresa());
		BDDMockito.given(this.empresaRepository.save(Mockito.any(Empresa.class))).willReturn(new Empresa());
	}
	
	@Test
	public void testBuscarEmpresaPorCnpj() {
		Optional<Empresa> empresa = this.empresaService.buscarPorCnpj(CNPJ);
		
		assertTrue(empresa.isPresent());
	}
	
	@Test
	public void testPersistirEmpresa() {
		Empresa empresa = this.empresaService.persistir(new Empresa());
		
		assertNotNull(empresa);
	}
	
	public static void roda() {
		String x = "1234567890";
		
		x = x.substring(5,7);
		
		char y = x.charAt(1);
		
		x = x + y;
		System.out.println("TESTE" + x);
	}
	

}
