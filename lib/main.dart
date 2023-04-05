import 'package:boleto_digital/view/boleto_offline/boleto_offline_teste_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_aprovar_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_cancelar_exame_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_intercorrencia_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_aprovar_exame_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_cancelar_exame_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_intercorrencia_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_reprovar_exame_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_reprovar_exame_view.dart';
import 'package:boleto_digital/view/exames/exames_em_andamento_presidente_view.dart';
import 'package:boleto_digital/view/exames/identificacao_candidato_autenticado_view.dart';
import 'package:boleto_digital/view/exames/intercorrencias_banca_view.dart';
import 'package:boleto_digital/view/exames/lista_de_exames_concluidos_view.dart';
import 'package:boleto_digital/view/habilitar/erro_hablitacao_incompativel_categoria_view.dart';
import 'package:boleto_digital/view/habilitar/examinador_atribuido_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_exame_pratico_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_identificacao_presidente_view.dart';
import 'package:boleto_digital/view/habilitar/identificacao_do_examinador_view.dart';
import 'package:boleto_digital/view/habilitar/identificacao_do_presidente_view.dart';
import 'package:boleto_digital/view/habilitar/presidente_habilitado_sucesso_view.dart';
import 'package:boleto_digital/view/exames/boleto_eletronico_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_boleto_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_edicao_boleto_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_presidente_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebidaG_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_banca_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_boleto_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_edicao_boleto_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_recebida_view.dart';
import 'package:boleto_digital/view/exames/assinaturas/assinatura_view.dart';
import 'package:boleto_digital/view/boleto_offline/boleto_offline_view.dart';
import 'package:boleto_digital/view/exames/busca_candidato_exame_view.dart';
import 'package:boleto_digital/view/exames/cancelamento_confirmado_boleto_view.dart';
import 'package:boleto_digital/view/exames/cancelar_exame_view.dart';
import 'package:boleto_digital/view/exames/confirmar_edicao_boleto_view.dart';
import 'package:boleto_digital/view/exames/confirmar_validacao_exame_view.dart';
import 'package:boleto_digital/view/exames/editar_boleto_view.dart';
import 'package:boleto_digital/view/exames/erro_carro_invalido_view.dart';
import 'package:boleto_digital/view/exames/erro_limite_carros_view.dart';
import 'package:boleto_digital/view/exames/lista_de_exames_para_aplicar_view.dart';
import 'package:boleto_digital/view/exames/exame_finalizado_boleto_view.dart';
import 'package:boleto_digital/view/exames/tipo_de_exame_view.dart';
import 'package:boleto_digital/view/exames/identicacao_do_candidato_view.dart';
import 'package:boleto_digital/view/exames/identificacao_veiculo_view.dart';
import 'package:boleto_digital/view/exames/reprovar_exame_view.dart';
import 'package:boleto_digital/view/exames/solicitacao_cancelamento_prova_view.dart';
import 'package:boleto_digital/view/exames/solicitar_cancelamento_boleto_view.dart';
import 'package:boleto_digital/view/exames/identificacao_veiculo_autenticado_view.dart';
import 'package:boleto_digital/view/exames/visualizar_boleto_view.dart';
import 'package:boleto_digital/view/habilitar/examinador_habilitado_sucesso_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_examinador_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_presidente_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_presidente_categoria_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_presidente_local_view.dart';
import 'package:boleto_digital/view/habilitar/habilitar_view.dart';
import 'package:boleto_digital/view/home_view.dart';
import 'package:boleto_digital/view/login/login_view.dart';
import 'package:boleto_digital/view/login/recuperacao_senha_1_view.dart';
import 'package:boleto_digital/view/login/recuperacao_senha_3_view.dart';
import 'package:boleto_digital/view/relatorios/analises_de_avaliacoes_view.dart';
import 'package:boleto_digital/view/relatorios/analises_de_exames_view.dart';
import 'package:boleto_digital/view/relatorios/relatorios_de_exames_pratico_view.dart';
import 'package:boleto_digital/view/relatorios/relatorios_view.dart';
import 'package:boleto_digital/widgets/custom_camera.dart';
import 'package:boleto_digital/widgets/custom_camera_view.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/login/recuperacao_senha_2_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(MaterialApp(
    initialRoute: '/',
    title: 'Flutter Demo',
    routes: {
      '/home': (context) => Home(),
      '/login/recuperacaoSenha1': (context) => RecuperacaoSenha1View(),
      '/login/recuperacaoSenha2': (context) => RecuperacaoSenha2View(),
      '/login/recuperacaoSenha3': (context) => RecuperacaoSenha3View(),
      '/': (context) => LoginView(),
      '/exames': (context) => const Exames(),
      '/boleto': (context) => const Boleto(),
      '/visualizarboleto': (context) => const VisualizarBoletoView(),
      '/editarBoleto': (context) => const EditarBoleto(),
      '/escolherExame': (context) => const EscolherExame(),
      '/buscaCandidatoExame': (context) => const BuscaCandidatoExame(),
      '/identificacaoVeiculo': (context) => const IdentificacaoVeiculo(),
      '/assinatura': (context) => SignaturePadApp(),
      '/erroCarroInvalido': (context) => const ErroCarroInvalido(),
      '/erroLimiteDeCarros': (context) => const ErroLimiteDeCarros(),
      '/veiculoAutenticado': (context) =>
          const IdentificacaoVeiculoAutenticado(),
      '/identificacaoCandidato': (context) => const IdentificacaoCandidato(),
      '/candidatoAutenticado': (context) => const CandidatoAutenticado(),
      '/solicitacaoDeCancelamento': (context) =>
          const SolicitacaoDeCancelamento(),
      '/camera': (context) => CustomCamera(camera: firstCamera),
      '/assinaturaRecebida': (context) => const AssinaturaRecebida(),
      '/confirmarValidacaoExame': (context) => const AprovarExame(),
      '/assinaturaPresidente': (context) => AssinaturaPresidente(),
      '/assinaturaRecebida': (context) => const AssinaturaRecebidaG(),
      '/assinaturaRecebidaBanca': (context) => const AssinaturaRecebidaBanca(),
      '/assinaturaRecebidaBoleto': (context) =>
          const AssinaturaRecebidaBoleto(),
      '/assinaturaBoleto': (context) => AssinaturaBoleto(),
      '/boletoOffline': (context) => const BoletoOffline(),
      '/habilitar': (context) => const Habilitar(),
      '/habilitar/habilitarPresidente': (context) => HabilitarPresidente(),
      '/habilitar/habilitarExaminador': (context) =>
          const HabilitarExaminador(),
      HabilitarExamePratico.routeName: (context) => HabilitarExamePratico(),
      '/habilitar/habilitarExaminador/examePratico/erroHabilitacao':
          (context) => const ErroHabilitacaoImcompativel(),
      '/habilitar/habilitarExaminador/examePratico/examinadorAtribuido':
          (context) => const ExaminadorAtribuido(),
      '/identificacaoDoExaminador': (context) => IdentificacaoExaminador(),
      '/habilitar/habilitarExaminador/examePratico/examinadorAbilitadoSucesso':
          (context) => const ExaminadorAbilitadoSucesso(),
      HabilitarPresidenteCategoria.routeName: (context) =>
          HabilitarPresidenteCategoria(),
      HabilitarPresidenteLocal.routeName: (context) =>
          HabilitarPresidenteLocal(),
      HabilitarIdentificacaoPresidente.routeName: (context) =>
          const HabilitarIdentificacaoPresidente(),
      '/habilitar/habilitarPresidente/identificacao/habilitarIdentificacaoPresidente':
          (context) => const IdentificacaoPresidente(),
      '/habilitar/habilitarPresidente/identificacao/presidenteAbilitadoSucesso':
          (context) => const PresidenteHabilitado(),
      '/boletoOfflineView': (context) => const BoletoOfflineTeste(),
      '/solicitarCancelamento': (context) =>
          const SolicitarCancelamentoBoleto(),
      '/exameFinalizado': (context) => const ExameFinalizadoBoleto(),
      '/cancelamentoConfirmadoBoleto': (context) =>
          const CancelamentoConfirmadoBoleto(),
      '/relatoriosExames': (context) => const RelatoriosView(),
      '/relatoriosExames/analisesDeAvaliacoes': (context) =>
          const AnalisesDeAvaliacoes(),
      '/relatoriosExames/analisesDeExames': (context) =>
          const AnalisesDeExames(),
      '/relatoriosExames/relatoriosDeExamesPratico': (context) =>
          const RelatoriosDeExamesPratico(),
      '/confirmarEdicaoExame': (context) => const ConfirmarEdicaoExame(),
      '/assinaturaEdicaoBoleto': (context) => AssinaturaEdicao(),
      '/assinaturaRecebidaEdicaoBoleto': (context) =>
          const AssinaturaRecebidaEdicaoBoleto(),
      '/cancelarExame': (context) => const CancelarExame(),
      '/assinaturaCancelarExame': (context) => const AssinaturaCancelarExame(),
      '/assinaturaCancelarExameRecebida': (context) =>
          const AssinaturaRecebidaCancelarExame(),
      '/reprovarExame': (context) => const ReprovarExame(),
      '/assinaturaReprovarExame': (context) => const AssinaturaReprovarExame(),
      '/assinaturaReprovarExameRecebida': (context) =>
          const AssinaturaRecebidaReprovarExame(),
      '/examesAndamento': (context) => const ExamesEmAndamento(),
      '/intercorrenciaBanca': (context) => const IntercorrenciaBanca(),
      '/listaExamesConcluidos': (context) => const ListaDeExamesConcluidos(),
      '/assinaturaIntercorrencia': (context) =>
          const AssinaturaIntercorrencia(),
      '/assinaturaIntercorrenciaRecebida': (context) =>
          const AssinaturaRecebidaIntercorrencia(),
      '/assinaturaAprovarExame': (context) => const AssinaturaAprovarExame(),
      '/assinaturaAprovarExameRecebida': (context) =>
          const AssinaturaRecebidaAprovarExame(),
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
